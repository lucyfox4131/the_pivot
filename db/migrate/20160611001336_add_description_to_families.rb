class AddDescriptionToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :description, :string
  end
end
