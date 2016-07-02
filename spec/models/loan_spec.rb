require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { should validate_presence_of(:purpose) }
  it { should validate_presence_of(:requested_amount) }
  it { should validate_presence_of(:description) }

  it { should belong_to(:family) }

  scenario "it returns active loans" do
    family = create(:family)
    loan_1, loan_2 = create_list(:loan, 2)

    expect(Loan.active.count).to eq(2)
    expect(loan_1.active?).to eq(true)
   end

   scenario "it identifies active loan" do
     family = create(:family)
     loan = create(:loan)

     expect(loan.active?).to eq(true)
    end

  scenario "it retires property" do
    family = create(:family)
    loan = create(:loan)

    loan.retire_loan

    expect(loan.status).to eq("retired")
  end

end
