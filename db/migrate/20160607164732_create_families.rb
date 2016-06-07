class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :first_name
      t.string :last_name
      t.integer :num_people
      t.string :nationality
      t.date :arrival_date

      t.timestamps null: false
    end
  end
end
