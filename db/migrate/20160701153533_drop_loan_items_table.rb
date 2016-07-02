class DropLoanItemsTable < ActiveRecord::Migration
  def change
    drop_table :loan_items
  end
end
