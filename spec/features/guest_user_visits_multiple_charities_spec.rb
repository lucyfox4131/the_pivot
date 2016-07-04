require 'rails_helper'

RSpec.feature "Guest User Sees Many Charities" do
  context "a guest user visits the root page" do
    scenario "they are able to successfully view charities" do
      charity_1, charity_2, charity_3 = create_list(:charity, 3)
      family_1, family_2 = create_list(:family, 2)
      visit root_path

      expect(page).to have_link("See All Charities")
      click_on "See All Charities"

      expect(current_path).to eq(charities_path)
      expect(page).to have_link(charity_1.name)
      expect(page).to have_link(charity_2.name)
      expect(page).to have_link(charity_3.name)

      click_link charity_1.name
      expect(current_path).to eq(charity_path(charity_1.slug))
      expect(page).to have_content(charity_1.description)
    end
  end
end
