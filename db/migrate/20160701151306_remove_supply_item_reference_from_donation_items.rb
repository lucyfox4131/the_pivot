class RemoveSupplyItemReferenceFromDonationItems < ActiveRecord::Migration
  def change
    remove_reference :donation_items, :supply_item
  end
end
