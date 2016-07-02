class SupplyItemDecorator < SimpleDelegator

  attr_reader :supply_item_quantity

  def initialize(supply_item, quantity)
    @supply_item_quantity = quantity
    super(supply_item)
  end
end
