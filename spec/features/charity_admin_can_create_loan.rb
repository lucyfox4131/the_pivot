require 'rails_helper'

RSpec.feature "Admin creates loan" do
  scenario "new loan is added to family" do
    charity_admin = create(:user)
    charity = create(:charity)
    role = Role.create(name: "charity_admin")
    UserRole.create(user: charity_admin, charity: charity, role: role)
    family_1, family_2, family_3 = create_list(:family, 3, charity: charity)
    loan = create(:loan, family_id: family_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( charity_admin )

    visit admin_families_path

    click_button "Update Loan"
  
    expect(current_path).to eq(edit_loan_path(loan))

  end
end
