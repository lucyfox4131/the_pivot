class AddReferencesToDonationItems < ActiveRecord::Migration
  def change
    add_reference :donation_items, :supply_item, index: true, foreign_key: true
    add_reference :donation_items, :loan, index: true, foreign_key: true
  end
end
