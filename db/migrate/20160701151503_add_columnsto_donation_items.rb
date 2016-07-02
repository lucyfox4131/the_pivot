class AddColumnstoDonationItems < ActiveRecord::Migration
  def change
    add_column :donation_items, :class_name, :string
    add_column :donation_items, :item_id, :integer
  end
end
