require 'rails_helper'

RSpec.feature "user can see all families affiliated w/ category" do
  scenario "user sees list of affiliated families" do
    nationality1 = create(:nationality, name: "Somali")
    nationality2 = create(:nationality, name: "Syrian")

    family1 = create(:family)
    family2 = create(:family, nationality: nationality2)

    category1 = Category.create(name: "Most Critical", slug: "most-critical")
    category2 = Category.create(name: "Elderly", slug: "elderly")
    category3 = Category.create(name: "Children", slug: "children")

    family1.categories << [category1, category2]
    family2.categories << [category2, category3]

    visit category_path(category2)

    expect(page).to have_content "Somali"
    expect(page).to have_content "Syrian"

    visit category_path(category1)

    expect(page).to_not have_content "Syrian"
  end
end
