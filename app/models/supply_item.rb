class SupplyItem < ActiveRecord::Base
  belongs_to :supply
  belongs_to :family

  def self.find_family(id)
    find(id).family
  end

  def name
    supply.name
  end

  def description
    supply.description
  end

  def value
    supply.value
  end

  def quantity_remaining
    quantity - donation_items.sum(:quantity)
  end

  def subtotal(quantity)
    supply.value * quantity.to_i
  end
end
