require 'rails_helper'

RSpec.feature "user sees past donation" do
  scenario "donation page is shown for authenticated user" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    family1 = create(:family)
    family2 = create(:family, nationality: create(:nationality, name: "Burmese"))

    supply1 = create(:supply, name: "Small Pot", value: 3.0, multiplier_type: "household")
    supply2 = create(:supply, name: "Couch", value: 100.0, multiplier_type: "household")

    supply_item1 = create(:supply_item, supply: supply1, quantity: 2, family: family1)
    supply_item2 = create(:supply_item, supply: supply2, quantity: 2, family: family2)

    donation1 = create(:donation, status: "Received", user: user)
    donation2 = create(:donation)

    donation_item = create(:donation_item, quantity: 2, supply_item: supply_item1, donation: donation1)
    donation_item2 = create(:donation_item, quantity: 2, supply_item: supply_item2, donation: donation1)
    donation_item3 = create(:donation_item, quantity: 1, supply_item: supply_item1, donation: donation2)

    visit donations_path
    click_on(donation1.id)
    expect(current_path).to eq(donation_path(donation1))

    expect(page).to have_content("Small Pot")
    expect(page).to have_content("$3.00")
    expect(page).to have_content("$6.00")
    expect(page).to have_content("Couch")
    expect(page).to have_content("$100.00")
    expect(page).to have_content("$200.00")
    expect(page).to have_content("$206.00")
    expect(page).to have_content(donation1.updated_at.to_date)
    expect(page).to have_content(donation1.status)
    click_on("Somali family of 3")
    expect(current_path).to eq(family_path(family1))
  end

  scenario "donation page is not shown if not user's donation" do
    user = create(:user)
    other_user = create(:other_user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    family1 = create(:family)
    supply1 = create(:supply, name: "Small Pot", value: 3.0)
    supply_item1 = create(:supply_item, supply_id: supply1.id, quantity: 2, family_id: family1.id)

    donation1 = create(:donation, status: "Received", user: other_user)
    donation_item = create(:donation_item, quantity: 2, supply_item_id: supply_item1.id, donation_id: donation1.id)

    visit donation_path(donation1)

    expect(current_path).to eq(root_path)
    expect(page).to have_content("No donation found.")
  end
end
