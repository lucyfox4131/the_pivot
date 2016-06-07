class ChangeFamilyTable < ActiveRecord::Migration
  def change
    add_column :families, :num_married_adults,     :integer
    add_column :families, :num_unmarried_adults,   :integer
    add_column :families, :num_children_over_two,  :integer
    add_column :families, :num_children_under_two, :integer
    add_column :families, :donation_deadline,      :date

    remove_column :families, :num_people,  :integer
    remove_column :families, :nationality, :string
  end
end
