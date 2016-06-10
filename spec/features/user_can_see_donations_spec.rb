require 'rails_helper'

RSpec.feature "user can see all donations" do
  scenario "authenticated user sees list of only her donations" do

    user = User.create(username: "test", password: "password")
    other_user = User.create(username: "other", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    nationality = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif" ,info_link: "Somali", greeting: "most-critical", name: "Somali")

    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)


    supply = Supply.create(name: "Small Pot", value: 3.0, description: "New or used.", multiplier_type: "household")
    supply2 = Supply.create(name: "Couch", value: 100.0, description: "New or used.  Used must be in good condition.", multiplier_type: "household")
    other_supply = Supply.create(name: "Large Pot", value: 3.0, description: "New or used.", multiplier_type: "household")

    supply_item = SupplyItem.create(supply: supply, quantity: 1, family: family)
    supply_item2 = SupplyItem.create(supply: supply2, quantity: 1, family: family)
    other_supply_item = SupplyItem.create(supply: other_supply, quantity: 1, family: family)

    donation = Donation.create(status: "Pledged", user: user)
    other_donation = Donation.create(status: "Pledged", user: other_user)

    donation_item = DonationItem.create(quantity: 1, supply_item: supply_item, donation: donation)
    donation_item2 = DonationItem.create(quantity: 1, supply_item: supply_item2, donation: donation)
    other_donation_item = DonationItem.create(quantity: 1, supply_item: other_supply_item, donation: other_donation)

    visit donations_path

    expect(page).to have_content("#{user.username}'s Donations")
    expect(page).to have_content("Total Donations: 1")
    expect(page).to have_content("Somali family of 3")
    expect(page).to have_content("1 Small Pot")
    expect(page).to have_content("1 Couch")
    expect(page).to_not have_content("1 Large Pot")

  end

  scenario "guest user visiting donations is redirected to log in" do
    visit donations_path

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Please login to see your donation history")

  end



end
