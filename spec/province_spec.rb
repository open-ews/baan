require "spec_helper"

module Baan
  RSpec.describe Province do
    it "handles working with provinces" do
      all_provinces = Province.all

      expect(all_provinces).to be_a(Array)
      expect(all_provinces.count).to eq(18)

      vientiane_prefecture = Province["LA-VT"]

      expect(vientiane_prefecture).to have_attributes(
        code: "LA-VT",
        name_en: "Vientiane Prefecture",
        name_lo: "ວຽງຈັນ",
        districts: include(
          have_attributes(
            code: "0101",
            name_en: "Chanthabuly",
            name_lo: "ຈັນທະບູລີ",
            parent_division: vientiane_prefecture,
            subdivisions: []
          )
        ),
        parent_division: nil
      )
    end
  end
end
