module Baan
  class Cache
    attr_reader :parser

    def initialize(parser: Parser.new)
      @parser = parser
    end

    def data
      @data ||= begin
        dataset.each_with_object(Hash.new { |h, k| h[k] = {} }) do |(key, dataset), result|
          dataset.each { result[key][it.code] = it }
        end
      end
    end

    private

    def dataset
      @dataset ||= begin
        data = parser.parse
        { Province => data.provinces, District => data.districts }
      end
    end
  end
end
