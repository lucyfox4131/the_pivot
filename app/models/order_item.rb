class OrderItem < ActiveRecord::Base
  belongs_to :supply_item
  belongs_to :order

end
