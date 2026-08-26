require "spec_helper"

module Baan
  RSpec.describe Province do
    it "handles working with provinces" do
      all_provinces = Province.all

      expect(all_provinces).to be_a(Array)
      expect(all_provinces.count).to eq(18)

      attapeu = Province["LA-AT"]

      expect(attapeu).to have_attributes(
        code: "LA-AT",
        name_en: "Attapeu",
        name_lo: "ອັດຕະປື",
        districts: include(
          have_attributes(
            code: "1703",
            name_en: "Sanamxay",
            name_lo: "ສະໜາມໄຊ"
          )
        ),
        villages: include(
          have_attributes(
            code: "17010001",
            name_en: "Sakare",
          ),
          have_attributes(
            code: "17030001",
            name_en: "Mitsumphun"
          )
        ),
        parent_division: nil
      )
    end
  end
end
