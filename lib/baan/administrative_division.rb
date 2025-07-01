module Baan
  AdministrativeDivision = Data.define(:code, :name_en, :name_lo, :subdivisions, :parent_division) do
    class << self
      def all
        data.values
      end

      def [](code)
        data[code]
      end

      private

      def data
        @data ||= cache.data.fetch(self)
      end

      def cache
        @cache ||= Cache.new
      end
    end
  end
end
