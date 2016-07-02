require 'rails_helper'

RSpec.feature "Admin updates loan for family" do
  scenario "admin sees updated loan information" do
    charity_admin = create(:user)
    charity = create(:charity)
    role = Role.create(name: "charity_admin")
    UserRole.create(user: charity_admin, charity: charity, role: role)
    family_1, family_2, family_3 = create_list(:family, 3, charity: charity)
    loan = create(:loan, family_id: family_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( charity_admin )

    visit admin_families_path

    within(".admin-families-list-item:first") do
      click_button "Update Loan"
    end

    expect(current_path).to eq(edit_loan_path(loan))

    fill_in "Requested amount", with: "2000.00"
    fill_in "Purpose", with: "This is an updated purpose"

    click_on "Update Loan"

    expect(current_path).to eq(admin_families_path)
    expect(page).to have_content("Your updates have been saved")

    loan = Loan.find(loan.id)

    expect(loan.requested_amount).to eq(2000.00)
    expect(loan.purpose).to eq("This is an updated purpose")
  end
end
