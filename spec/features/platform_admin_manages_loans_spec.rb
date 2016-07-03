require "rails_helper"

RSpec.feature "Platform admin manages loan information" do
  context "user is logged in as platform admin" do
    scenario "platform admin successfully updates loan" do

      platform_admin = create(:user)
      charity_1 = create(:charity, status: "online")
      role = Role.create(name: "platform_admin")
      UserRole.create(user: platform_admin, role: role)
      family_1, family_2, family_3 = create_list(:family, 3, charity: charity_1)
      loan = create(:loan, status: "active", family_id: family_2.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

      visit admin_dashboard_path

      click_on "All Families"

      expect(page).to have_content(family_1.last_name)
      expect(page).to have_content(family_2.last_name)
      expect(page).to have_content(family_3.last_name)

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

    end
  end
end

# # Make sure a platform admin can see within all charities the ability to edit family and loan information for that specific charity.
# # As a platform admin I can manage loans for families and associated with any charity.
