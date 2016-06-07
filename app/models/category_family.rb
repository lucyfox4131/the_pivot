class CategoryFamily < ActiveRecord::Base
  belongs_to :family
  belongs_to :category
end
