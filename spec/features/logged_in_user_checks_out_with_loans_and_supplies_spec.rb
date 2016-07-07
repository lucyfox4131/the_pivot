require 'rails_helper'

RSpec.feature "user can checkout with loans and supplies in cart" do
  scenario "they checkout and see the donations page with their donation" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    family = create(:family)
    supply = create(:supply, name: "Small Pot")
    supply_item = create(:supply_item, quantity: 1)
    loan = create(:loan)

    visit family_path(family)

    within(".#{family.last_name}-loan-info") do
      select 15, from: "loan[requested_amount]"
      find(:button, 'add to cart').click
    end

    within(".Small") do
      click_on "add to cart"
    end

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
end
