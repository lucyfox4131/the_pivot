class AddFamilyPhotoToFamilies < ActiveRecord::Migration
  def change
    add_attachment :families, :family_photo
  end
end
