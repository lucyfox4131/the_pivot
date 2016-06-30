class LoanItem < ActiveRecord::Base
  validates :amount, presence: true

  belongs_to :loan
  belongs_to :donation
end
