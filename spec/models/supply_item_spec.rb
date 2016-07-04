require 'rails_helper'

RSpec.describe SupplyItem, type: :model do
  it { should belong_to(:supply) }
  it { should belong_to(:family) }
  it { should have_many(:donation_items) }

  it "returns correct name, value, and desctiption" do

    family = create(:family)

    supply = create(:supply, name: "Twin Bedframe",
                             value:  30.0,
                             description: "Sample.",
                             multiplier_type: "child"  )

    supply_item = create(:supply_item, family: family, supply: supply, quantity: 2)

    expect(supply_item.name).to eq("Twin Bedframe")
    expect(supply_item.value).to eq(30.0)
    expect(supply_item.description).to eq("Sample.")
  end

  it "calculates correct quantity remaining" do
    family = create(:family)
    supply = create(:supply, name: "Twin Bedframe", value: 30.0)
    supply_item = create(:supply_item, family: family, supply: supply, quantity: 2)
    user = create(:user)
    donation = create(:donation, user: user)
    create(:donation_item, quantity: 1,
                           supply_item: family.supply_items.first,
                           donation: donation)

    expect(supply_item.quantity_remaining).to eq(1)
  end
end
