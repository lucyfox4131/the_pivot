require 'rails_helper'

RSpec.describe SupplyItem, type: :model do
  it { should belong_to(:supply) }
  it { should belong_to(:family) }
  it { should have_many(:donation_items) }

  it "has gets correct name, value, and desctiption" do
    nationality1 = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "x")
    fam1 = Family.create(first_name: "x",
      last_name: "x",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality_id: nationality1.id,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 1,
      num_children_under_two: 0)
    supply = Supply.create(name: "Twin Bedframe",
      value:  30.0,
      description: "Sample.",
      multiplier_type: "child"  )
    supply_item = SupplyItem.create(family: fam1, supply: supply, quantity: 2)

    expect(supply_item.name).to eq("Twin Bedframe")
    expect(supply_item.value).to eq(30.0)
    expect(supply_item.description).to eq("Sample.")
  end

  it "calculates correct quantity remaining" do
    nationality1 = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "x")
    fam1 = Family.create(first_name: "x",
      last_name: "x",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality_id: nationality1.id,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 1,
      num_children_under_two: 0)
    supply = Supply.create(name: "Twin Bedframe",
      value:  30.0,
      description: "Sample.",
      multiplier_type: "child"  )
    supply_item = SupplyItem.create(family: fam1, supply: supply, quantity: 2)

    user1 = User.create(username: "user1", password: "password", email: "email@example.com")
    donation = Donation.create(status: "Pledged", user: user1)
    DonationItem.create(quantity: 1,
      supply_item: fam1.supply_items.first,
      donation: donation)

    expect(supply_item.quantity_remaining).to eq(1)
  end

end
