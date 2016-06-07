require 'rails_helper'

RSpec.feature "user can see all families affiliated w/ category" do
  scenario "user sees list of affiliated families" do
    family1 = Family.create(first_name: "First1", last_name: "Last1", num_people: 4, nationality: "Somali", arrival_date: Date.today)
    family2 = Family.create(first_name: "First2", last_name: "Last2", num_people: 2, nationality: "Syrian", arrival_date: Date.today)

    category1 = Category.create(name: "Most Critical")
    category2 = Category.create(name: "Elderly")
    category3 = Category.create(name: "Children")

    family1.categories << [category1, category2]
    family2.categories << [category2, category3]

    visit category_path(category2)

    expect(page).to     have_content "Somali"
    expect(page).to     have_content "Syrian"

    visit category_path(category1)

    expect(page).to_not have_content "Syrian"
  end
end
