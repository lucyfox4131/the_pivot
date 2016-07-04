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
    user = create(:user)
    supply = create(:supply, value: 3.0)
    supply = create(:supply)
    family = create(:family)
    supply_item = create(:supply_item)
    donation = create(:donation)

    donation_item_1 = create(:donation_item, quantity: 2,
      supply_item: supply_item,
      donation: donation)

    donation_item_2 = create(:donation_item, quantity: 2,
      supply_item: supply_item,
      donation: donation)

    expect(donation.total).to eq(12.0)
  end

  it "outputs donation date" do
    user = create(:user)
    donation = create(:donation, created_at: '2016-06-14')

    expect(donation.date.to_s).to eq("2016-06-14")
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
