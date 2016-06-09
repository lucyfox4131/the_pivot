class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :supply_item, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
