class AddCharityReferenceToFamilies < ActiveRecord::Migration
  def change
    add_reference :families, :charity, index: true, foreign_key: true
  end
end
