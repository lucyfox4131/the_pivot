class CreateNationalities < ActiveRecord::Migration
  def change
    create_table :nationalities do |t|
      t.string  :photo_path
      t.string  :info_link
      t.string  :greeting

      t.timestamps null: false
    end
  end
end
