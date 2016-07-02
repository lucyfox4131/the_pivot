class ChangeColumnNameInLoan < ActiveRecord::Migration
  def change
    rename_column :loans, :name, :purpose
  end
end
