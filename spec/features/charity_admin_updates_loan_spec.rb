require 'rails_helper'

RSpec.feature "Admin updates loan for family" do
  scenario "admin sees updated loan information" do
    charity_admin = create(:user)
    charity = create(:charity)
    role = Role.create(name: "charity_admin")
    UserRole.create(user: charity_admin, charity: charity, role: role)
    family = create(:family, charity: charity)
    loan = create(:loan, family_id: family.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( charity_admin )

    visit admin_families_path

    within(".#{family.last_name}") do
      click_link "Update Loan"
    end

    expect(current_path).to eq(edit_loan_path(loan))

    within(".panel-body") do
      fill_in "Requested amount", with: "2000.00"
      fill_in "Purpose", with: "This is an updated purpose"
    end

    click_on "Update Loan"

    expect(current_path).to eq(admin_families_path)
    expect(page).to have_content("Your updates have been saved")

    visit family_path(family)

    within(".#{family.last_name}-loan-info") do
      expect(page).to have_content("$2,000.00")
      expect(page).to have_content("This is an updated purpose")
    end

  end
end
