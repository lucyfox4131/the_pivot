class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :requested_amount
      t.text :description
      t.string :name
      t.references :family, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
