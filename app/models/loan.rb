class Loan < ActiveRecord::Base
  belongs_to :family

  def donation_range
    donation_range = []
    (0..requested_amount).step(15) do |n|
      donation_range << n
    end
    donation_range
  end
end
