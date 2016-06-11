require 'rails_helper'

RSpec.describe Donation, type: :model do
  it {should belong_to(:user)}
  it {should have_many(:donation_items)}
  it { should validate_presence_of(:status) }
  it do
    should validate_inclusion_of(:status).
      in_array(["Pledged", "Received", "Cancelled"])
  end


  it "returns correct donation total" do

    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot", value: 3.0, description: "New or used.", multiplier_type: "household")

    nationality = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif" ,info_link: "Somali", greeting: "most-critical", name: "Somali")

    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: "Pledged", user: user)
    donation_item = DonationItem.create(quantity: 2, supply_item: supply_item, donation: donation)
    donation_item = DonationItem.create(quantity: 2, supply_item: supply_item, donation: donation)

    expect(donation.total).to eq(12.0)
  end


  it "outputs donation date" do
    user1 = User.create(username: "user1", password: "password")
    donation1 = Donation.create(status: 'pledged', user: user1)

    expect(donation1.date.to_s).to eq("2016-06-10")
  end
end
