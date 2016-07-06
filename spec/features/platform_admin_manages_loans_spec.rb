require "rails_helper"

RSpec.feature "Platform admin manages loan information" do
  context "user is logged in as platform admin" do
    scenario "platform admin successfully updates loan" do
      platform_admin = create(:user)
      charity_1, charity_2 = create_list(:charity, 2)
      role = Role.create(name: "platform_admin")
      UserRole.create(user: platform_admin, role: role)
      family_1 = create(:family, charity: charity_1)
      family_2 = create(:family, charity: charity_2)
      family_3 = create(:family, charity: charity_2)
      loan = create(:loan, status: "active", family_id: family_1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

      visit admin_dashboard_path

      within(".#{family_1.last_name}") do
        click_link "Update Loan"
      end

      expect(current_path).to eq(edit_loan_path(loan))

      fill_in "Requested amount", with: "2000.00"
      fill_in "Purpose", with: "This is an updated purpose"

      click_on "Update Loan"

      expect(current_path).to eq(admin_families_path)
      expect(page).to have_content("Your updates have been saved")
    end
  end
end
