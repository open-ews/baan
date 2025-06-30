require "yaml"

module Baan
  class Parser
    DEFAULT_DATA_FILE = Pathname(File.join(__dir__, "..", "..", "data", "provinces.yml")).freeze
    DEFAULT_DATA_KEY = "provinces".freeze

    attr_reader :data_file, :data_key

    def initialize(**options)
      @data_file = options.fetch(:data_file) { DEFAULT_DATA_FILE }
      @data_key = options.fetch(:data_key) { DEFAULT_DATA_KEY }
    end

    def parse
      data = YAML.load_file(data_file).fetch(data_key)
      data.map do |province_data|
        province = Province.new(parent_division: nil, subdivisions: [], **province_data.transform_keys(&:to_sym).except(:districts))

        province_data.fetch("districts").map do |district_data|
          province.subdivisions << District.new(parent_division: province, subdivisions: [], **district_data.transform_keys(&:to_sym))
        end

        province
      end
    end
  end
end
