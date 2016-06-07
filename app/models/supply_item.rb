class SupplyItem < ActiveRecord::Base
  belongs_to :supply
  belongs_to :family
end
