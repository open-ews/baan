module Baan
  class Province < AdministrativeDivision
    def districts
      subdivisions
    end
  end
end
