class AddMultiplierTypeToSupplies < ActiveRecord::Migration
  def change
    add_column :supplies, :multiplier_type, :string
  end
end
