class CreateSupplyItems < ActiveRecord::Migration
  def change
    create_table :supply_items do |t|
      t.references :supply, index: true, foreign_key: true
      t.references :family, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
