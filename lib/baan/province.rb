module Baan
  class Province < AdministrativeDivision
    class << self
      def all
        data
      end

      def [](code)
        data[code]
      end

      private

      def data
        @data ||= Cache.new.data
      end
    end

    def districts
      subdivisions
    end
  end
end
