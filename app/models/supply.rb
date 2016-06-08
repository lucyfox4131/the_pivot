class Supply < ActiveRecord::Base
  validates :multiplier_type, presence: true,
            inclusion: %w(adult baby child household person other)
end
