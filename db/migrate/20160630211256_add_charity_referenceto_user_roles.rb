class AddCharityReferencetoUserRoles < ActiveRecord::Migration
  def change
    add_reference :user_roles, :charity, index: true, foreign_key: true
  end
end
