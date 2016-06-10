require 'rails_helper'

RSpec.describe Cart, type: :model do

  it "adds//deletes//changes an item to and from the cart" do
    supply_item = Supply.create(name: "Twin Bedframe", value:  30.0, description: "New or used.  Used must be in good condition.", multiplier_type: "child")
    supply_item1 = Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child")

    cart = Cart.new({})
    cart.add_cart_item(supply_item.id, 1)

    expect(cart.contents).to eq({"7" => 1})

    cart.add_cart_item(supply_item1.id, 2)

    expect(cart.contents).to eq({"7"=>1, "8"=>2})

    cart.delete_cart_item(supply_item1.id.to_s)

    expect(cart.contents).to eq({"7"=>1})

    
  end
end
