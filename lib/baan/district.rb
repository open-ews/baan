module Baan
  class District < AdministrativeDivision
    def province
      parent_division
    end

    def villages
      subdivisions
    end
  end
end
