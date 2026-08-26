require "spec_helper"

module Baan
  RSpec.describe Village do
    it "handles working with villages" do
      all_villages = Village.all

      expect(all_villages).to be_a(Array)
      expect(all_villages.count).to eq(1335)

      mitsumphun_village = Village["17030001"]

      expect(mitsumphun_village).to have_attributes(
        code: "17030001",
        name_en: "Mitsumphun",
        name_lo: "ມິດສຳພັນ",
        latitude: 14.679558,
        longitude: 106.560371,
        district: have_attributes(
          code: "1703",
          name_en: "Sanamxay",
        ),
        province: have_attributes(
          code: "LA-AT",
          name_en: "Attapeu",
        )
      )
    end
  end
end
