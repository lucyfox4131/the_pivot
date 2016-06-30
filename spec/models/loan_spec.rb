require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { should validate_presence_of(:purpose) }
  it { should validate_presence_of(:requested_amount) }
  it { should validate_presence_of(:description) }

  it { should belong_to(:family) }
end
