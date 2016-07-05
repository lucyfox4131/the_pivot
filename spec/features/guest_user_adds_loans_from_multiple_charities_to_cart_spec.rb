require 'rails_helper'

RSpec.feature "Guest user visits multiple charities" do
  scenario "multiple loans can be added to a user cart" do
    family_1, family_2 = create_list(:family, 2)
    supply = create(:supply)
    supply_item = create(:supply_item)
    supply_item2 = create(:supply_item, family_id: 2)
    loan = create(:loan)

    visit family_path(family_1)

    within(".Twin") do
      select  1, from: "supply_item[quantity]"
      find(:button, "add to cart").click
    end

    within(".#{loan.purpose}") do
      select 15, from: "loan[requested_amount]"
      find(:button, 'add to cart').click
    end

    visit family_path(family_2)

    within(".Twin") do
      select  1, from: "supply_item[quantity]"
      find(:button, "add to cart").click
    end

    visit cart_index_path

    expect(page).to have_content("Twin Bedframe")
    expect(page).to have_content(loan.description)
    expect(page).to have_link("Login or Create Account to Checkout")
  end
end
