require 'rails_helper'

RSpec.feature "user can view loan info for family" do
  scenario "user visits loan page from family page" do
    family = create(:family)
    loan = create(:loan, family: family)

    visit family_path(family)

    expect(page).to have_content "This family has requested a Microloan to begin a business of their own"

    click_on "View Loan"

    expect(current_path).to eq(loan_path(loan))

    within(".panel-body") do
      expect(page).to have_content loan.description
    end

    within("#loan-amount") do
      expect(page).to have_content "$1,000.00"
    end
  end

  scenario "user does not see retired loans" do
    family = create(:family)
    loan = create(:loan, family: family)
    loan.retire_loan

    visit family_path(family)

    expect(page).to_not have_content "This family has requested a Microloan to begin a business of their own"
  end
end
