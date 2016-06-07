require 'rails_helper'

RSpec.feature "user can view all families" do
  scenario "they see a list of families" do
    family1 = Family.create(first_name: "First1", last_name: "Last1", num_people: 4, nationality: "Somali", arrival_date: Date.today)
    family2 = Family.create(first_name: "First2", last_name: "Last2", num_people: 2, nationality: "Syrian", arrival_date: Date.today)
    family3 = Family.create(first_name: "First3", last_name: "Last3", num_people: 3, nationality: "Iraqi", arrival_date: Date.today)
    family4 = Family.create(first_name: "First4", last_name: "Last4", num_people: 5, nationality: "Burmese", arrival_date: Date.today)
    family5 = Family.create(first_name: "First5", last_name: "Last5", num_people: 3, nationality: "Bhutanese", arrival_date: Date.today)

    visit families_path

    expect(page).to have_content "Somali"
    expect(page).to have_content "Syrian"
    expect(page).to have_content "Iraqi"
    expect(page).to have_content "Burmese"
    expect(page).to have_content "Bhutanese"
  end
end
