require 'rails_helper'

RSpec.feature "user can update item in cart" do
  scenario "items is updated" do
    nationality = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Somali")

    family = Family.create(first_name: "First1", last_name: "Last1", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality, num_married_adults: 2, num_unmarried_adults: 0, num_children_over_two: 2, num_children_under_two: 0)

    Supply.create(name: "Dresser", value: 50.0, description: "New or used.  Used must be in good condition.", multiplier_type: "adult")

    supply = family.create_supply_items

    visit family_path(family)

    within(".Dresser") do
      select  1, from: "supply_item[quantity]"
      find(:button, "add to cart").click
    end

    visit cart_index_path
    expect(page).to have_content("Total: $50.00")
    expect(page).to have_content("Dresser")

    within(".Dresser") do
      select  2, from: "supply_item[quantity]"
      click_on("Update Cart")
    end

    expect(page).to have_content("Total: $100.00")
  end
end
