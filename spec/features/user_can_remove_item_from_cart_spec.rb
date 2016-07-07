require 'rails_helper'

RSpec.feature "user can remove item from cart" do
  scenario "items is removed" do
    family = create(:family)
    supply = create(:supply, name: "Dresser", value: 50.0)
    supply_item = create(:supply_item, quantity: 1)

    visit family_path(family)

    within(".Dresser") do
      select  1, from: "supply_item[quantity]"
      find(:button, "add to cart").click
    end

    visit cart_index_path

    within("h2#cart-total") do
      expect(page).to have_content("Total: $50.00")
    end

    within("tr.#{supply.name}") do
      expect(page).to have_content("Dresser")
      click_on("Remove")
    end

    expect(page).to have_content("Successfully deleted Dresser from your cart")
    expect(page).to have_content("There are no items in your cart")
    click_on("Dresser")

    expect(current_path).to eq(family_path(family))
  end
end
