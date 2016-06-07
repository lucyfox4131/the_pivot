class AddNationalityToFamilies < ActiveRecord::Migration
  def change
    add_reference :families, :nationality, index: true, foreign_key: true
  end
end
