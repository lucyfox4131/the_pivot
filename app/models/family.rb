class Family < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :arrival_date, presence: true
  validates :num_married_adults, presence: true
  validates :num_unmarried_adults, presence: true
  validates :num_children_over_two, presence: true
  validates :num_children_under_two, presence: true
  validates :donation_deadline, presence: true

  has_many :category_families
  has_many :categories, through: :category_families

  has_many :supply_items
  has_many :supplies, through: :supply_items

  belongs_to :nationality
end
