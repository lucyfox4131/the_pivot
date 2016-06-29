class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.string :slug

      t.timestamps null: false
    end
  end
end
