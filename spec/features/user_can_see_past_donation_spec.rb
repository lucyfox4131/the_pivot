require 'rails_helper'

RSpec.feature "user sees past donation" do
  scenario "donation page is shown for authenticated user" do

    user = User.create(username: "test", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    nationality1 = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif" ,info_link: "Somali", greeting: "most-critical", name: "Somali")
    nationality2 = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif" ,info_link: "Somali", greeting: "most-critical", name: "Burmese")

    family1 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality1, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)
    family2 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality2, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)


    supply1 = Supply.create(name: "Small Pot", value: 3.0, description: "New or used.", multiplier_type: "household")
    supply2 = Supply.create(name: "Couch", value: 100.0, description: "New or used.  Used must be in good condition.", multiplier_type: "household")


    supply_item1 = SupplyItem.create(supply: supply1, quantity: 2, family: family1)
    supply_item2 = SupplyItem.create(supply: supply2, quantity: 2, family: family2)


    donation1 = Donation.create(status: 'Received', user: user)
    donation2 = Donation.create(status: 'Pledged', user: user)

    donation_item = DonationItem.create(quantity: 2, supply_item: supply_item1, donation: donation1)
    donation_item2 = DonationItem.create(quantity: 2, supply_item: supply_item2, donation: donation1)
    donation_item3 = DonationItem.create(quantity: 1, supply_item: supply_item1, donation: donation2)

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

    user = User.create(username: "test", password: "password")
    other_user = User.create(username: "other", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    nationality1 = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif" ,info_link: "Somali", greeting: "most-critical", name: "Somali")

    family1 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality1, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)

    supply1 = Supply.create(name: "Small Pot", value: 3.0, description: "New or used.", multiplier_type: "household")

    supply_item1 = SupplyItem.create(supply: supply1, quantity: 2, family: family1)

    donation1 = Donation.create(status: 'Received', user: other_user)

    donation_item = DonationItem.create(quantity: 2, supply_item: supply_item1, donation: donation1)

    visit donation_path(donation1)

    expect(current_path).to eq(root_path)
    expect(page).to have_content("No donation found.")

  end

end
