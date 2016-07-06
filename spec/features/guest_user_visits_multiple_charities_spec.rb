require 'rails_helper'

RSpec.feature "Guest User Sees Many Charities" do
  context "a guest user visits the root page" do
    scenario "they are able to successfully view charities" do
      charity_1, charity_2, charity_3 = create_list(:charity, 3)
      family_1, family_2 = create_list(:family, 2)

      visit root_path

      click_on "See All Charities"

      expect(current_path).to eq(charities_path)

      within("p.#{charity_1.slug}") do
        expect(page).to have_link(charity_1.name)
      end

      within("p.#{charity_2.slug}") do
        expect(page).to have_link(charity_2.name)
      end

      within("p.#{charity_3.slug}") do
        expect(page).to have_link(charity_3.name)
      end

      within("p.#{charity_1.slug}") do
        click_link charity_1.name
      end

      expect(current_path).to eq(charity_path(charity_1.slug))
      expect(page).to have_content(charity_1.description)
    end
  end
end
