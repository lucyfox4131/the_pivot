class RemoveClassNameFromDonationItems < ActiveRecord::Migration
  def change
    remove_column :donation_items, :class_name, :string
    remove_column :donation_items, :item_id, :integer
  end
end
