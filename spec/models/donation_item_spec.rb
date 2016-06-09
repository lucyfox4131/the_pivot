require 'rails_helper'

RSpec.describe DonationItem, type: :model do
  it {should belong_to(:donation)}
  it {should belong_to(:supply_item)}

  it "associates donations and donation items with users" do
    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot", value: 3.0, description: "New or used.", multiplier_type: "household")

    nationality = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif" ,info_link: "Somali", greeting: "most-critical", name: "Somali")

    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: 'pledged', user: user)
    donation_item = DonationItem.create(quantity: 2, supply_item: supply_item, donation: donation)

    expect(user.donations.count).to eq(1)
    expect(user.donation_items.count).to eq(1)
    expect(user.donation_items.first.supply_item.supply.name).to eq("Small Pot")
    expect(user.donation_items.first.supply_item.family.first_name).to eq("TestFirst")
  end

end
