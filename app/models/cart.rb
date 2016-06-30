class Cart
  attr_accessor :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_cart_item(item, quantity)
    if item.is_a? Integer
      contents[item.to_s] ||= 0
      contents[item.to_s] += quantity.to_i
    else
      contents["#{item.purpose}, #{item.id}"] ||= 0
      contents["#{item.purpose}, #{item.id}"] += quantity.to_i
    end
  end

  def delete_cart_item(cart_item)
    if cart_item.is_a? Loan
      contents.delete("#{cart_item.purpose}, #{cart_item.id}")
    else
      contents.delete(cart_item.to_s)
    end
  end

  def change_cart_item_quantity(cart_item_key, new_cart_item_quantity)
    if new_cart_item_quantity.to_i == 0
      contents.delete(cart_item_key)
    else
      contents[cart_item_key] = new_cart_item_quantity.to_i
    end
  end

  def total_items
    sum = 0
    contents.keys.each do |key|
      if key.to_i.to_s == key
        sum += contents[key]
      else
        sum += 1
      end
    end
    sum
  end

  def total_price
    total_price = 0
    contents.each do |item, amount|
      if item.to_i.to_s == item
        total_price += SupplyItem.find(item).supply.value * amount.to_i
      else
        total_price += amount
      end
    end
    total_price.to_f
  end

  def get_supply_items
    contents.map do |supply_item_id, quantity|
      if supply_item_id.to_i.to_s == supply_item_id
        CartItemHandler.new(supply_item_id, quantity)
      end
    end.compact
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

  def get_loan_items
    contents.map do |key, quantity|
      if key.to_i.to_s != key
        loan_id = key.split(", ").last.to_i
        Loan.find(loan_id)
      end
    end.compact
  end
end
