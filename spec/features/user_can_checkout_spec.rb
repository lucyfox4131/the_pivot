require 'rails_helper'

RSpec.feature "user can checkout with items in cart" do
  scenario "they checkout and see the donations page with their donation" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    family = create(:family)
    supply = create(:supply, name: "Pot-Small")
    supply_item = create(:supply_item, quantity: 1)

    visit family_path(family)

    click_on "add to cart"

    visit cart_index_path

    click_on "Checkout"

    within(".#{supply.name}") do
      expect(page).to have_content "Pot-Small"
      expect(page).to have_content "1"
    end

    click_on "Confirm Donation"

    expect(current_path).to eq(donations_path)

    expect(page).to have_content "Your donation (ID#: 1) was received. Thank you!"

    within(".family-info") do
      expect(page).to have_content "Somali family of 3"
    end

    within("td#donation-status") do
      expect(page).to have_content "Pledged"
    end

    within("td.donation-item-info") do
      expect(page).to have_content "Pot-Small"
    end

  end

  scenario "logged out user cannot checkout unless logged in" do
    user = create(:user, username: "test", password: "password")
    family = create(:family)
    supply = create(:supply, name: "Pot-Small", value: 3.0)
    supply_item = create(:supply_item, quantity: 1)

    visit family_path(family)

    click_on "add to cart"

    visit cart_index_path

    click_on "Login or Create Account to Checkout"

    within(".panel-body") do
      fill_in "Username", with: "test"
      fill_in "Password", with: "password"
      click_on "Login to Account"
    end

    expect(current_path).to eq(cart_index_path)

    within("tr.#{supply.name}") do
      expect(page).to have_content "Pot-Small"
      expect(page).to have_content "$3.00"
    end

    within("h2#cart-total") do
      expect(page).to have_content "Total: $3.00"
    end
  end
end
