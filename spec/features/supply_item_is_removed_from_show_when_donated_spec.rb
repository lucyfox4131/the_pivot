require 'rails_helper'

RSpec.feature  "family list show correct items needed when donations made" do
  scenario "item removed when fully donated" do
    user = create(:user)
    fam1 = create(:family)
    supply = create(:supply)
    supply_item = create(:supply_item)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return( user )

    visit family_path(fam1)

    expect(page).to have_content("Twin Bedframe")

    within(".Twin") do
      click_on "add to cart"
    end

    visit cart_index_path

    click_on "Checkout"
    click_on "Confirm Donation"

    visit family_path(fam1)

    expect(page).to_not have_content("Twin Bedframe")
  end

  scenario "selector reduced when partially donated" do
    user = create(:user)
    fam1 = create(:family)
    supply = create(:supply)
    supply_item = create(:supply_item)
    donation = create(:donation)
    donation_item = create(:donation_item)

    visit family_path(fam1)
    
    within(".Twin") do
      expect(page).to have_select("supply_item[quantity]", options: ["1", "2"])
      expect(page).to_not have_select("supply_item[quantity]",
        options: ["1", "2", "3"])
    end
  end
end
