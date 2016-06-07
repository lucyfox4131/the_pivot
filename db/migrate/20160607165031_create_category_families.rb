class CreateCategoryFamilies < ActiveRecord::Migration
  def change
    create_table :category_families do |t|
      t.references :family, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
