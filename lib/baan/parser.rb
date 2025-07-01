require "yaml"

module Baan
  class Parser
    DEFAULT_DATA_FILE = Pathname(File.join(__dir__, "..", "..", "data", "provinces.yml")).freeze
    DEFAULT_ROOT_KEY = "provinces".freeze
    Result = Data.define(:provinces, :districts)

    attr_reader :data_file, :root_key

    def initialize(**options)
      @data_file = options.fetch(:data_file) { DEFAULT_DATA_FILE }
      @root_key = options.fetch(:root_key) { DEFAULT_ROOT_KEY }
    end

    def parse
      data = YAML.load_file(data_file).fetch(root_key)
      districts = []
      provinces = data.map do |province_data|
        province = Province.new(parent_division: nil, subdivisions: [], **province_data.transform_keys(&:to_sym).except(:districts))

        province_data.fetch("districts").map do |district_data|
          district = District.new(parent_division: province, subdivisions: [], **district_data.transform_keys(&:to_sym))
          province.subdivisions << district
          districts << district
        end

        province
      end

      Result.new(provinces:, districts:)
    end
  end
end
