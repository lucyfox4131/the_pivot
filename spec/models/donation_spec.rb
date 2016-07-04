require 'rails_helper'

RSpec.describe Donation, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:donation_items) }
  it { should validate_presence_of(:status) }
  it do
    should validate_inclusion_of(:status).
      in_array(["Pledged", "Received", "Cancelled"])
  end

  it "returns correct donation total" do
    user = User.create(username: "TestUser", password: "password", email: "email@example.com")
    supply = Supply.create(name: "Small Pot",
      value: 3.0,
      description: "New or used.",
      multiplier_type: "household")

    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")

    family = Family.create(first_name: "TestFirst",
      last_name: "TestLast",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality: nationality,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 0,
      num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: "Pledged", user: user)
    donation_item1 = DonationItem.create(quantity: 2,
      supply_item: supply_item,
      donation: donation)
    donation_item2 = DonationItem.create(quantity: 2,
      supply_item: supply_item,
      donation: donation)

    expect(donation.total).to eq(12.0)
  end

  it "outputs donation date" do
    user1 = User.create(username: "user1", password: "password")
    donation1 = Donation.create(status: 'Pledged', user: user1, created_at: '2016-06-14')

    expect(donation1.date.to_s).to eq("2016-06-14")
  end

  it "returns correct donation stats" do
    user = create(:user)
    supply_1 = create(:supply, value: 50.0)
    supply_2 = create(:supply, value: 5.0)

    family, family_2 = create_list(:family, 2)

    supply_item_1 = create(:supply_item, supply: supply_1, quantity: 1, family: family)
    supply_item_2 = create(:supply_item, supply: supply_2, quantity: 3, family: family)

    donation = create(:donation, status: "Pledged", user: user)
    donation_item1 = create(:donation_item, quantity: 1,
      supply_item: supply_item_1,
      donation: donation)
    donation_item2 = create(:donation_item, quantity: 2,
      supply_item: supply_item_2,
      donation: donation)

    expect(Donation.stats[:num_items]).to eq(3)
    expect(Donation.stats[:num_families]).to eq(2)
    expect(Donation.stats[:money_raised]).to eq(60.0)
  end
end
