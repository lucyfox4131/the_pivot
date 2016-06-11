require 'rails_helper'
require 'database_cleaner'

RSpec.describe Cart, type: :model do
  DatabaseCleaner.cleaning do

  it "adds//deletes an item to and from the cart" do
    supply_item = Supply.create(name: "Twin Bedframe", value:  30.0, description: "New or used.  Used must be in good condition.", multiplier_type: "child")
    supply_item1 = Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child")

    cart = Cart.new({})
    cart.add_cart_item(supply_item.id, 1)

    expect(cart.contents).to eq({"7" => 1})

    cart.add_cart_item(supply_item1.id, 2)

    expect(cart.contents).to eq({"7"=>1, "8"=>2})

    cart.delete_cart_item(supply_item1.id)

    expect(cart.contents).to eq({"7"=>1})
  end

  it "changes item quantity from the cart" do
    supply_item1 = Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child")

    cart = Cart.new({})
    cart.add_cart_item(supply_item1.id, 3)

    expect(cart.contents).to eq({"9"=>3})

    cart.change_cart_item_quantity("9", 1)

    expect(cart.contents).to eq({"9"=>1})

    cart.change_cart_item_quantity("9", 6)

    expect(cart.contents).to eq({"9"=>6})
  end

  it "outputs accurate number for total items//price in cart" do
    supply_item = Supply.create(name: "Twin Bedframe", value:  30.0, description: "New or used.  Used must be in good condition.", multiplier_type: "child")
    supply_item1 = Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child")

    cart = Cart.new({})
    cart.add_cart_item(supply_item.id, 1)
    cart.add_cart_item(supply_item1.id, 2)

    expect(cart.total_items).to eq(3)
    # expect(cart.total_price).to eq("")
  end
end
end
