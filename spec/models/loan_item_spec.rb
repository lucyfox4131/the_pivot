require 'rails_helper'

RSpec.describe LoanItem, type: :model do
  it { should validate_presence_of(:amount) }

  it { should belong_to(:loan) }
  it { should belong_to(:donation) }
end
