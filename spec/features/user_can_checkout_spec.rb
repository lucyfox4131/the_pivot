require 'rails_helper'

RSpec.feature "user can checkout with items in cart" do
  scenario "they checkout and see the donations page with their donation" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    family = create(:family)
    supply = create(:supply, name: "Small Pot")
    supply_item = create(:supply_item, quantity: 1)

    visit family_path(family)

    click_on "add to cart"

    visit cart_index_path

    click_on "Checkout"

    expect(page).to have_content "Small Pot"
    expect(page).to have_content "1"

    click_on "Confirm Donation"

    expect(page).to have_content "Your donation (ID#: 1) was received. Thank you!"
    expect(page).to have_content "Somali family of 3"
    expect(page).to have_content "1 Small Pot"
    expect(page).to have_content "Pledged"
  end

  scenario "logged out user cannot checkout unless logged in" do
    user = create(:user, username: "test", password: "password")
    family = create(:family)
    supply = create(:supply, name: "Small Pot", value: 3.0)
    supply_item = create(:supply_item, quantity: 1)

    visit family_path(family)

    click_on "add to cart"

    visit cart_index_path

    click_on "Login or Create Account to Checkout"

    fill_in "Username", with: "test"
    fill_in "Password", with: "password"
    click_on "Login to Account"

    expect(page).to have_content "Small Pot"
    expect(page).to have_content "Total: $3.00"
  end
end
