require 'rails_helper'

RSpec.feature "user sees correct info for current and past families" do
  scenario "they see a form for family that will arrive" do
    family = create(:family)
    supply = create(:supply, name: "School Supplies",
                             value: 10.0,
                             multiplier_type: "child")
    family.supply_items.create(supply: supply, quantity: 2)

    visit family_path(family)
    expect(page).to_not have_content("Family Arrived")
    expect(page).to have_content(family.arrival_date.to_formatted_s(:long))
    expect(page).to have_content("Donate by:")
    expect(page).to have_button("add to cart")
  end

  scenario "they see list of donations for family that already arrived" do
    family = create(:family, arrival_date: 10.days.ago,
                             donation_deadline: 15.days.ago)
    supply = create(:supply, name: "School Supplies",
                             value: 10.0,
                             multiplier_type: "child")
    family.supply_items.create(supply: supply, quantity: 2)

    user = create(:user)
    donation = create(:donation, status: "Received", user: user)
    donation_item1 = create(:donation_item, quantity: 1, supply_item_id: family.supply_items.first.id,
          donation: donation)

        visit family_path(family)
        expect(page).to have_content("Family Arrived")
        expect(page).to_not have_content(family.arrival_date.to_formatted_s(:long))
        expect(page).to_not have_content("Donate by:")
        expect(page).to_not have_button("add to cart")
        expect(page).to have_content("Donated Item")
        expect(page).to have_content(donation.created_at.to_formatted_s(:long))
        expect(page).to have_content("School Supplies")
      end

    end
