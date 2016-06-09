class ChangeReferencesOnDonationItems < ActiveRecord::Migration
  def change
    remove_column :donation_items, :order_id, :integer
    add_reference :donation_items, :donation, index: true, foreign_key: true
  end
end
