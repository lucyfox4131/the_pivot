class SupplyItemDecorator < SimpleDelegator

  attr_reader :quantity

  def initialize(supply_item, quantity)
    @quantity = quantity
    super(supply_item)
  end
  # def initialize(supply_item, quantity)
  #   # @supply_item  = SupplyItem.find(supply_item_id)
  #   @quantity = quantity
  #   super(@supply_item)
  # end
end

#change the name of this to supply item decorator and have a loan decorator as well
