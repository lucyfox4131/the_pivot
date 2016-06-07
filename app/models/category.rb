class Category < ActiveRecord::Base
  has_many :category_families
  has_many :families, through: :category_families
end
