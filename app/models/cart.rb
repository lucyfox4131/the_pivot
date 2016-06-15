class Cart
  attr_accessor :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_cart_item(supply_item_id, quantity)
    contents[supply_item_id.to_s] ||= 0
    contents[supply_item_id.to_s] += quantity.to_i
  end

  def delete_cart_item(supply_item_id)
    contents.delete(supply_item_id.to_s)
  end

  def change_cart_item_quantity(supply_item_id, supply_item_quantity)
    if supply_item_quantity.to_i == 0
      contents.delete(supply_item_id)
    else
      contents[supply_item_id] = supply_item_quantity.to_i
    end
  end

  def total_items
    contents.values.sum
  end

  def total_price
    contents.reduce(0) do |total, (item_id, quantity)|
      total + SupplyItem.find(item_id).supply.value * quantity
    end.to_f
  end

  def get_supply_items
    contents.map do |supply_item_id, quantity|
      CartItemHandler.new(supply_item_id, quantity)
    end
  end

  def get_supply_items_hash
    get_supply_items.inject({}) do |hash, cart_item|
      hash[cart_item.supply_item] = cart_item.quantity
      hash
    end
  end

  def get_supply_list_from_cart
    get_supply_items.map do |cart_item|
      cart_item.supply
    end
  end
end
