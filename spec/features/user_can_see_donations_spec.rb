require 'rails_helper'

RSpec.feature "user can see all donations" do
  scenario "authenticated user sees list of only her donations" do
    user = create(:user)
    other_user = create(:other_user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    family = create(:family, nationality: create(:nationality, name: "Somali"))
    supply = create(:supply, name: "Small Pot", value: 3.0)
    supply2 = create(:supply, name: "Couch", value: 100.0)
    other_supply = create(:supply, name: "Large Pot", value: 3.0)

    supply_item = create(:supply_item, supply: supply, quantity: 1)
    supply_item2 = create(:supply_item, supply: supply2, quantity: 1)
    other_supply_item = create(:supply_item, supply: other_supply, quantity: 1)

    donation = create(:donation, user: user)
    other_donation = create(:donation, user: other_user)

    donation_item = create(:donation_item, donation_id: donation.id)
    donation_item2 = create(:donation_item, supply_item_id: supply_item2.id, donation_id: donation.id)
    other_donation_item = create(:donation_item, supply_item_id: other_supply_item.id, donation_id: other_donation.id)

    visit donations_path

    expect(page).to have_content("#{user.username}'s Donations")
    expect(page).to have_content("Total Donations: 1")

    within("td.family-info") do
      expect(page).to have_content("Somali family of 3")
    end

    within("td.donation-item-info") do
      expect(page).to have_content("1 Small Pot")
      expect(page).to have_content("1 Couch")
      expect(page).to_not have_content("1 Large Pot")
    end
  end

  scenario "guest user visiting donations is redirected to log in" do
    visit donations_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You Do Not Have Access")
  end
end
