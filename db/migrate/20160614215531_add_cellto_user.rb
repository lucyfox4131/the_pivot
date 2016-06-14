class AddCelltoUser < ActiveRecord::Migration
  def change
    add_column :users, :cell, :string
  end
end
