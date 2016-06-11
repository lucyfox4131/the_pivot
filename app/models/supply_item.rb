class SupplyItem < ActiveRecord::Base
  belongs_to :supply
  belongs_to :family

  def self.get_supply_list_from_cart(cart_items)
    cart_items.map do |supply_item_id, _quantity|
      find(supply_item_id).supply
    end
  end

  def self.get_supply_items_from_cart(cart_items)
    hash = {}
    cart_items.each do |supply_item_id, quantity|
      hash[find(supply_item_id)] = quantity
    end
    hash
  end
end
