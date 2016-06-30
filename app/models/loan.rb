class Loan < ActiveRecord::Base
  validates :purpose,          presence: true
  validates :requested_amount, presence: true
  validates :description,      presence: true

  belongs_to :family
end
