require "spec_helper"

module Baan
  RSpec.describe District do
    it "handles working with districts" do
      all_districts = District.all

      expect(all_districts).to be_a(Array)
      expect(all_districts.count).to eq(148)

      sanamxay_district = District["1703"]

      expect(sanamxay_district).to have_attributes(
        code: "1703",
        name_en: "Sanamxay",
        name_lo: "ສະໜາມໄຊ",
        province: have_attributes(
          code: "LA-AT",
          name_en: "Attapeu",
          name_lo: "ອັດຕະປື"
        ),
        villages: include(
          have_attributes(
            code: "17030001",
            name_en: "Mitsumphun"
          )
        )
      )
    end
  end
end
