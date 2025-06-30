module Baan
  class Province < AdministrativeDivision
    def initialize(districts: [], **options)
      subdivisions = districts.map { |district| District.new(**district, parent_division: self) }
      super(subdivisions: subdivisions, **options)
    end

    def districts
      subdivisions
    end
  end
end
