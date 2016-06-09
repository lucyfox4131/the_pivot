
require 'rails_helper'

RSpec.feature "user can remove item from cart" do
  scenario "items is removed" do

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


  save_and_open_page

    expect(page).to have_content("Dresser")
    click_on("Remove")
    
    expect(page).to have_content("Successfully deleted Dresser")
    expect(page).to have_content("Total: $0.00")


    click_on("Dresser")

    expect(current_path).to eq(family_path(family))


  end

end
