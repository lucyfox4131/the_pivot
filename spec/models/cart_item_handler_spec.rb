require 'rails_helper'

RSpec.describe CartItemHandler, type: :model do
  it "initializes correctly" do
    family = create(:family)

    supply = Supply.create(name: "Twin Bedframe",
      value:  30.0,
      description: "Sample.",
      multiplier_type: "child")
    supply_item = SupplyItem.create(family: family, supply: supply, quantity: 2)

    handler = CartItemHandler.new(supply_item.id, 1)

    expect(handler.supply_item.name).to eq("Twin Bedframe")
    expect(handler.quantity).to eq(1)
  end
end
