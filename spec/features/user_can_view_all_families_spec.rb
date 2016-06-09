require 'rails_helper'

RSpec.feature "user can view all families" do
  scenario "they see a list of families" do

    nationality1 = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Somali")
    nationality2 = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Syrian")
    nationality3 = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Iraqi")

    family1 = Family.create(first_name: "First1", last_name: "Last1", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality1, num_married_adults: 2, num_unmarried_adults: 0, num_children_over_two: 2, num_children_under_two: 0)

    family2 = Family.create(first_name: "First1", last_name: "Last1", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality2, num_married_adults: 0, num_unmarried_adults: 1, num_children_over_two: 1, num_children_under_two: 0)

    family3 = Family.create(first_name: "First1", last_name: "Last1", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality3, num_married_adults: 0, num_unmarried_adults: 1, num_children_over_two: 1, num_children_under_two: 0)


    visit families_path

    expect(page).to have_content "Somali"
    expect(page).to have_content "Syrian"
    expect(page).to have_content "Iraqi"

  end
end
