class RenameOrdersToDonations < ActiveRecord::Migration
  def change
    rename_table :orders, :donations
    rename_table :order_items, :donation_items
  end
end
