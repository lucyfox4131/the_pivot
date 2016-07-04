require "rails_helper"

RSpec.feature "Platform admin changes charity status" do
  context "user is logged in as platform admin" do
    scenario "platform admin succcessfully changes status from online to offline" do
      charity = create(:charity, status: 1)
      platform_admin = create(:user)
      role = Role.create(name: "platform_admin")
      UserRole.create(user: platform_admin, role: role)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

      visit admin_dashboard_path

      within(".#{charity.name}") do
        select "offline", from: "Status"
        click_on "Update Status"
      end

      expect(page).to have_content("Your updates have been saved")

      visit charities_path

      expect(page).to_not have_content("#{charity.name}")
    end
  end

  context "user is logged in as platform admin" do
    scenario "platform admin succcessfully changes status from pending to online" do
      charity = create(:charity, status: 0)
      platform_admin = create(:user)
      role = Role.create(name: "platform_admin")
      UserRole.create(user: platform_admin, role: role)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

      visit admin_dashboard_path

      visit admin_dashboard_path

      within(".#{charity.name}") do
        select "online", from: "Status"
        click_on "Update Status"
      end

      expect(page).to have_content("Your updates have been saved")

      visit charities_path

      expect(page).to have_content("#{charity.name}")
    end
  end
end
