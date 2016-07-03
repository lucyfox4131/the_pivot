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

    within(".online-charity") do
      click_button "Update Charity"
    end

    expect(current_path).to eq(edit_charity_path(online_charity))

    fill_in "Name", with: "New Name"
    fill_in "Description", with: "Updated description of this charity."
    click_on "Update Charity"

    expect(page).to have_content("Your updates have been saved")

    within(".online-charity") do
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

      expect(page).to have_content("#{online_charity.slug}")

      expect(page).to_not have_content("#{pending_charity.slug}")
      expect(page).to_not have_content("#{offline_charity.slug}")
      expect(page).to_not have_content("Pending Charities")
      expect(page).to_not have_content("Online Charities")
      expect(page).to_not have_content("Offline Charities")
    end
  end
end
  # As a platform admin I can update charity information in the same way a business admin can.
  # Next to each charity name where you can update status you can also update other charity information?


  #
  # scenario "platform admin manages family information" do
  #   platform_admin = create(:user)
  #   charity_1 = create(:charity, status: "online")
  #   role = Role.create(name: "platform_admin")
  #   UserRole.create(user: platform_admin, role: role)
  #   family_1, family_2, family_3 = create_list(:family, 3, charity: charity_1)
  #   loan = create(:loan, status: "active", family_id: family_1.id)
  #
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )
  #
  #   visit admin_families_path
  #
  #   expect(page).to have_content(family_1.last_name)
  #   expect(page).to have_content(family_2.last_name)
  #   expect(page).to have_content(family_3.last_name)
  #
  #   click_on "#{family_2.last_name}"
  #
  #   expect(current_path).to eq(admin_family_path(family_2))
  #   #ADD UPDATE FUNCTIONALITY
  # end
  #

  #
  # scenario "platform admin manages charity admins" do
  #   platform_admin = create(:user)
  #   role = Role.create(name: "platform_admin")
  #   UserRole.create(user: platform_admin, role: role)
  #
  #   charity_1 = create(:charity, status: "online")
  #   family_1, family_2, family_3 = create_list(:family, 3, charity: charity_1)
  #   # loan = create(:loan, family_id: family_1.id)
  #   charity_admin_1 = create(:user)
  #   role = Role.create(name: "charity_admin")
  #   UserRole.create(user: charity_admin_1, role: role, charity: charity_1)
  #
  #   charity_admin_2 = create(:user)
  #   role = Role.create(name: "charity_admin")
  #   UserRole.create(user: charity_admin_2, role: role, charity: charity_1)
  #
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )
  #
  #   visit admin_dashboard_path
  #
  #   click_on "All Charities"
  #   # expect(page).to have_content("Online Charities")
  #   expect(page).to have_content("#{charity_1.name}")
  # end
  # A platform admin can see all admins for each charity and is able to view options to change the status of an admin.
  # As a platform admin I can manage admins for any charity.
