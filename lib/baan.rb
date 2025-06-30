require_relative "baan/version"

module Baan
  def self.initialize!(data_directory: File.join(__dir__, "..", "data", "data.yaml"))
    data = YAML.load_file(data_directory)
    data.deep_symbolize_keys!

    data.fetch(:provinces).each do |province|
      Province.new(**province)
    end
  end
end
