class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string  :name
      t.string  :description
      t.decimal :value

      t.timestamps null: false
    end
  end
end
