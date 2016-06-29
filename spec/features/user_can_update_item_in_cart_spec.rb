require 'rails_helper'

RSpec.feature "user can update item in cart" do
  scenario "items is updated" do

    family = create(:family)
    create(:supply, name: "Dresser", value: 50.0, multiplier_type: "adult")
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
