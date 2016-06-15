class Supply < ActiveRecord::Base

  validates :multiplier_type, presence: true,
            inclusion: %w(adult baby child household person other)
  validates :name, presence: true
  validates :description, presence: true
  validates :value, presence: true

  has_many :supply_items
  has_many :families, through: :supply_items
end
