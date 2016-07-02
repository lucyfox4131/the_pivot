class DropCharityAdmins < ActiveRecord::Migration
  def change
    drop_table :charity_admins
  end
end
