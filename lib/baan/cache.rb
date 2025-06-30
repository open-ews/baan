module Baan
  class Cache
    attr_reader :parser

    def initialize(parser: Parser.new)
      @parser = parser
    end

    def data
      @data ||= parser.parse.each_with_object({}) { |province, result| result[province.code] = province }
    end
  end
end
