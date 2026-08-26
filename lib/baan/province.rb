module Baan
  class Province < AdministrativeDivision
    def districts
      subdivisions
    end

    def villages
      districts.flat_map(&:villages)
    end
  end
end
