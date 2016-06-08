require 'rails_helper'

RSpec.feature "user can see all families affiliated w/ category" do
  scenario "user sees list of affiliated families" do
    nationality1 = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Somali")
    nationality2 = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Syrian")

    family1 = Family.create(first_name: "First1", last_name: "Last1", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality1, num_married_adults: 2, num_unmarried_adults: 0, num_children_over_two: 2, num_children_under_two: 0)

    family2 = Family.create(first_name: "First1", last_name: "Last1", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality2, num_married_adults: 0, num_unmarried_adults: 1, num_children_over_two: 1, num_children_under_two: 0)

    category1 = Category.create(name: "Most Critical", slug: "most-critical")
    category2 = Category.create(name: "Elderly", slug: "elderly")
    category3 = Category.create(name: "Children", slug: "children")

    family1.categories << [category1, category2]
    family2.categories << [category2, category3]

    visit category_path(category2)

    expect(page).to     have_content "Somali"
    expect(page).to     have_content "Syrian"

    visit category_path(category1)

    expect(page).to_not have_content "Syrian"
  end
end
