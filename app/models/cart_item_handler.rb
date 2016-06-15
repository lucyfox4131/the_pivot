class CartItemHandler < SimpleDelegator

  attr_reader :supply_item, :quantity

  def initialize(supply_item_id, quantity)
    @supply_item  = SupplyItem.find(supply_item_id)
    @quantity = quantity
    super(@supply_item)
  end
end
