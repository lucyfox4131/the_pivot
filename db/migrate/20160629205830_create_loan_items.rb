class CreateLoanItems < ActiveRecord::Migration
  def change
    create_table :loan_items do |t|
      t.integer :amount
      t.references :loan, index: true, foreign_key: true
      t.references :donation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
