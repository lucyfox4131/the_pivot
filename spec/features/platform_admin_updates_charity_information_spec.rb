require "rails_helper"

RSpec.feature "Platform admin updates charity information" do
  context "user is logged in as platform admin" do
    scenario "platform successfully updates charity" do
      platform_admin = create(:user)
      pending_charity = create(:charity, status: 0)
      online_charity = create(:charity, status: 1)
      offline_charity = create(:charity, status: 2)
      role = Role.create(name: "platform_admin")
      UserRole.create(user: platform_admin, role: role)
      family_1, family_2, family_3 = create_list(:family, 3, charity: online_charity)
      loan = create(:loan, family_id: family_1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

      visit admin_dashboard_path

      expect(page).to have_content("Pending Charities")
      expect(page).to have_content("Online Charities")
      expect(page).to have_content("Offline Charities")

      within(".#{online_charity.name}") do
        click_button "Update Charity"
      end

      expect(current_path).to eq(edit_charity_path(online_charity))

      fill_in "Name", with: "New Name"
      fill_in "Description", with: "Updated description of this charity."
      click_on "Update Charity"

      expect(page).to have_content("Your updates have been saved")

      within(".New") do
        expect(page).to have_content("New Name")
      end
  end
end

  context "user is not logged in as platform admin" do
    scenario "charity admin cannot see pending or offline charities" do
      charity_admin = create(:user)
      pending_charity = create(:charity, status: 0)
      online_charity = create(:charity, status: 1)
      offline_charity = create(:charity, status: 2)
      role = Role.create(name: "charity_admin")
      UserRole.create(user: charity_admin, charity: online_charity, role: role)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( charity_admin )

      visit admin_dashboard_path

      within(".charity-admin-charity") do
        expect(page).to have_content("#{online_charity.slug}")
      end

      expect(page).to_not have_content("#{pending_charity.slug}")
      expect(page).to_not have_content("#{offline_charity.slug}")
      expect(page).to_not have_content("Pending Charities")
      expect(page).to_not have_content("Online Charities")
      expect(page).to_not have_content("Offline Charities")
    end
  end
end
