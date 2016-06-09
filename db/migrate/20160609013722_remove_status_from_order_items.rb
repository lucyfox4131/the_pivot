class RemoveStatusFromOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :status, :string
  end
end
