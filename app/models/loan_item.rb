class LoanItem < ActiveRecord::Base
  belongs_to :loan
  belongs_to :donation
end
