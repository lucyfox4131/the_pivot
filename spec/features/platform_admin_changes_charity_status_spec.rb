require "rails_helper"

RSpec.feature "Platform admin changes charity status" do
  context "user is logged in as platform admin" do
    scenario "platform admin succcessfully changes charity status" do
      charity_1 = create(:charity, status: 1)
      charity_2 = create(:charity, status: 2)
      platform_admin = create(:user)
      role = Role.create(name: "platform_admin")
      UserRole.create(user: platform_admin, role: role)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

      visit admin_dashboard_path

      within(".#{charity_1.name}") do
        select "offline", from: "Status"
        click_on "Update Status"
      end

      expect(page).to have_content("Your updates have been saved")

      visit charities_path

      expect(page).to_not have_content("#{charity_1.name}")
    end
  end
end
