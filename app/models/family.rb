class Family < ActiveRecord::Base
  has_many :category_families
  has_many :categories, through: :category_families
end
