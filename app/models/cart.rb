class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_supply_item(supply_item_id, quantity)
    contents[supply_item_id.to_s] ||= 0
    contents[supply_item_id.to_s] += quantity.to_i
  end

  def total_items
    contents.values.sum
  end

  def total_price
    total = 0
    contents.map do |item_id, quantity|
      total += SupplyItem.find(item_id).supply.value * quantity
    end
    total
  end


end
