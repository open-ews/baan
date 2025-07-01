require "spec_helper"

module Baan
  RSpec.describe District do
    it "handles working with districts" do
      all_districts = District.all

      expect(all_districts).to be_a(Array)
      expect(all_districts.count).to eq(148)

      chanthabuly_district = District["0101"]

      expect(chanthabuly_district).to have_attributes(
        code: "0101",
        name_en: "Chanthabuly",
        name_lo: "ຈັນທະບູລີ",
        province: have_attributes(
          code: "LA-VT",
          name_en: "Vientiane Prefecture",
          name_lo: "ວຽງຈັນ"
        )
      )
    end
  end
end
