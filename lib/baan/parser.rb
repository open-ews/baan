require "yaml"

module Baan
  class Parser
    DEFAULT_DATA_FILE = Pathname(File.join(__dir__, "..", "data", "provinces.yml")).freeze
    DEFAULT_ROOT_KEY = "provinces".freeze
    Result = Data.define(:provinces, :districts, :villages)

    attr_reader :data_file, :root_key

    def initialize(**options)
      @data_file = options.fetch(:data_file) { DEFAULT_DATA_FILE }
      @root_key = options.fetch(:root_key) { DEFAULT_ROOT_KEY }
    end

    def parse
      data = YAML.load_file(data_file).fetch(root_key)
      districts = []
      villages = []
      provinces = data.map do |province_data|
        province = Province.new(
          parent_division: nil,
          subdivisions: [],
          latitude: nil,
          longitude: nil,
          **province_data.transform_keys(&:to_sym).except(:districts)
        )

        province_data.fetch("districts").map do |district_data|
          district = District.new(
            parent_division: province,
            subdivisions: [],
            latitude: nil,
            longitude: nil,
            **district_data.transform_keys(&:to_sym).except(:villages)
          )

          district_data.fetch("villages", []).map do |village_data|
            village = Village.new(
              parent_division: district,
              subdivisions: [],
              latitude: nil,
              longitude: nil,
              **village_data.transform_keys(&:to_sym)
            )
            district.subdivisions << village
            villages << village
            village
          end

          province.subdivisions << district
          districts << district
          district
        end

        province
      end

      Result.new(provinces:, districts:, villages:)
    end
  end
end
