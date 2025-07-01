module Baan
  class District < AdministrativeDivision
    def province
      parent_division
    end
  end
end
