class DonationItem < ActiveRecord::Base
  belongs_to :supply_item
  belongs_to :donation

end
