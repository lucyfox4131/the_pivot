require 'rails_helper'

RSpec.feature "user can checkout with items in cart" do
  scenario "they checkout and see the donations page with their donation" do
    user = User.create(username: "test", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    nationality = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif",
        info_link: "Somali", greeting: "most-critical", name: "Somali")
    family = Family.create(first_name: "TestFirst", last_name: "TestLast",
        arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now,
        nationality: nationality, num_married_adults: 2, num_unmarried_adults: 1,
        num_children_over_two: 0, num_children_under_two: 0)
    supply = Supply.create(name: "Small Pot", value: 3.0,
        description: "New or used.", multiplier_type: "household")
    supply_item = SupplyItem.create(supply: supply, quantity: 1, family: family)

    visit family_path(family)

    click_on "add to cart"

    visit cart_index_path

    click_on "Checkout"

    expect(page).to have_content "Small Pot"
    expect(page).to have_content "1"

    click_on "Confirm Donation"

    expect(page).to have_content "Your donation, #1, was recieved. Thank you!"
    expect(page).to have_content "Somali family of 3"
    expect(page).to have_content "1 Small Pot"
    expect(page).to have_content "Pledged"
  end

  scenario "logged out user cannot checkout unless logged in" do
    user = User.create(username: "test", password: "password")

    nationality = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif",
        info_link: "Somali", greeting: "most-critical", name: "Somali")
    family = Family.create(first_name: "TestFirst", last_name: "TestLast",
        arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now,
        nationality: nationality, num_married_adults: 2, num_unmarried_adults: 1,
        num_children_over_two: 0, num_children_under_two: 0)
    supply = Supply.create(name: "Small Pot", value: 3.0,
        description: "New or used.", multiplier_type: "household")
    supply_item = SupplyItem.create(supply: supply, quantity: 1, family: family)

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
