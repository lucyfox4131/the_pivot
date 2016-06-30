class Loan < ActiveRecord::Base
  validates :purpose, presence: true
  validates :requested_amount, presence: true
  validates :description, presence: true

  belongs_to :family

  def donation_range
    donation_range = []
    (0..requested_amount).step(15) do |n|
      donation_range << n
    end
    donation_range
  end
end
