require 'rails_helper'

RSpec.feature "user can see all families affiliated w/ category" do
  scenario "user sees list of affiliated families" do
    family1 = create(:family, nationality: create(:nationality, name: "Somali"))
    family2 = create(:family, nationality: create(:nationality, name: "Syrian"))

    category1, category2, category3 = create_list(:category, 3)

    family1.categories << [category1, category2]
    family2.categories << [category2, category3]

    visit category_path(category2.slug)

    expect(page).to have_content "Somali"
    expect(page).to have_content "Syrian"

    visit category_path(category1)

    expect(page).to_not have_content "Syrian"
  end
end
