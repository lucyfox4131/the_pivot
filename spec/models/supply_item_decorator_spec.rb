require 'rails_helper'

RSpec.describe SupplyItemDecorator, type: :model do
  it "initializes correctly" do
    family = create(:family)

    supply = Supply.create(name: "Twin Bedframe",
      value:  30.0,
      description: "Sample.",
      multiplier_type: "child")
    supply_item = SupplyItem.create(family: family, supply: supply, quantity: 2)

    handler = SupplyItemDecorator.new(supply_item, 1)

    expect(handler.name).to eq("Twin Bedframe")
    expect(handler.supply_item_quantity).to eq(1)
  end
end
