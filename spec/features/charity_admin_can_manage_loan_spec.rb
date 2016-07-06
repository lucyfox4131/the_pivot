require 'rails_helper'

RSpec.feature "Charity admin manages loans" do
  context "logged in charity admin is able to see loan information" do
    scenario "succesfully views information necessary" do
      charity_admin = create(:user)
      charity = create(:charity)
      role = Role.create(name: "charity_admin")
      UserRole.create(user: charity_admin, charity: charity, role: role)
      family_1, family_2 = create_list(:family, 2, charity: charity)
      loan = create(:loan, family_id: family_1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( charity_admin )

      visit admin_dashboard_path

      expect(page).to have_link("All Families")

      click_link "All Families"

      within(".row-nationality-active") do
        expect(page).to have_content("#{family_1.last_name}, #{family_1.first_name}")
        expect(page).to have_content("#{family_2.last_name}, #{family_2.first_name}")
      end

      within(".#{family_1.last_name}") do
        expect(page).to have_link("Update Loan")
      end

      within(".#{family_2.last_name}") do
        expect(page).to have_link("Add Loan")
      end

    end
  end
end
