require 'rails_helper'

RSpec.feature "Guest user visits multiple charities" do
  scenario "multiple loans can be added to a user cart" do
    family_1, family_2 = create_list(:family, 2)
    supply = create(:supply, name: "Twin Bedframe")
    supply2 = create(:supply, name: "Dresser")
    supply_item = create(:supply_item, supply: supply)
    supply_item2 = create(:supply_item, supply: supply2, family_id: 2)
    loan = create(:loan)

    visit family_path(family_1)

    within(".Twin") do
      select  1, from: "supply_item[quantity]"
      find(:button, "add to cart").click
    end

    within(".#{family_1.last_name}-loan-info") do
      select 15, from: "loan[requested_amount]"
      find(:button, 'add to cart').click
    end

    visit family_path(family_2)

    within(".Dresser") do
      select  1, from: "supply_item[quantity]"
      find(:button, "add to cart").click
    end

    visit cart_index_path

    within("tr.Twin") do
      expect(page).to have_content("Twin Bedframe")
    end

    within("tr.Dresser") do
      expect(page).to have_content("Dresser")
    end

    within("tr.#{loan.purpose}") do
      expect(page).to have_content(loan.description)
    end

    expect(page).to have_link("Login or Create Account to Checkout")
  end
end
