module Baan
  class Village < AdministrativeDivision
    def district
      parent_division
    end

    def province
      district.province
    end
  end
end
