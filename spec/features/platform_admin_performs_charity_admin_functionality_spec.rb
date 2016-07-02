require "rails_helper"

RSpec.feature "Platform admin performs charity admin-restricted functionality" do
  # scenario "platform admin updates charity information" do
  #   platform_admin = create(:user)
  #   charity_1 = create(:charity, status: "pending")
  #   charity_2 = create(:charity, status: "online")
  #   charity_3 = create(:charity, status: "offline")
  #   role = Role.create(name: "platform_admin")
  #   UserRole.create(user: platform_admin, role: role)
  #   family_1, family_2, family_3 = create_list(:family, 3, charity: charity_2)
  #   loan = create(:loan, family_id: family_1.id)
  #
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )
  #
  #   visit admin_dashboard_path

  #   click_on "All Charities"

  #   expect(page).to have_content("Pending Charities")
  #   expect(page).to have_content("Online Charities")
  #   expect(page).to have_content("Offline Charities")
  #
  #   # within css expect dropdown "change status"
  #   click_on "#{charity_1.name}"
  #   expect(current_path).to eq(charity_path(charity_1))
  #   click_on "Update Charity"
  #
  #   expect(current_path).to eq(edit_charity_path(charity))
  #
  #   fill_in "Name", with: "New Name"
  #   fill_in "Description", with: "Updated description of this charity."
  #   click_on "Update Charity"
  #
  #   expect(page).to have_content("Your updates have been saved")
  #   expect(page).to have_content("New Name")
  #   expect(page).to have_content("Update Charity")
  # end

  # As a platform admin I can update charity information in the same way a business admin can.
  # Next to each charity name where you can update status you can also update other charity information?

  scenario "platform admin manages loans associated with any charity" do
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

  scenario "platform admin manages family information" do
    platform_admin = create(:user)
    charity_1 = create(:charity, status: "online")
    role = Role.create(name: "platform_admin")
    UserRole.create(user: platform_admin, role: role)
    family_1, family_2, family_3 = create_list(:family, 3, charity: charity_1)
    loan = create(:loan, status: "active", family_id: family_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

    visit admin_families_path

    expect(page).to have_content(family_1.last_name)
    expect(page).to have_content(family_2.last_name)
    expect(page).to have_content(family_3.last_name)

    click_on "#{family_2.last_name}"

    expect(current_path).to eq(admin_family_path(family_2))
    #ADD UPDATE FUNCTIONALITY
  end

  # Make sure a platform admin can see within all charities the ability to edit family and loan information for that specific charity.
  # As a platform admin I can manage loans for families and associated with any charity.


  scenario "platform admin manages charity admins" do
    platform_admin = create(:user)
    role = Role.create(name: "platform_admin")
    UserRole.create(user: platform_admin, role: role)

    charity_1 = create(:charity, status: "online")
    family_1, family_2, family_3 = create_list(:family, 3, charity: charity_1)
    # loan = create(:loan, family_id: family_1.id)
    charity_admin_1 = create(:user)
    role = Role.create(name: "charity_admin")
    UserRole.create(user: charity_admin_1, role: role, charity: charity_1)

    charity_admin_2 = create(:user)
    role = Role.create(name: "charity_admin")
    UserRole.create(user: charity_admin_2, role: role, charity: charity_1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

    visit admin_dashboard_path

    click_on "All Charities"
    # expect(page).to have_content("Online Charities")
    expect(page).to have_content("#{charity_1.name}")
  end
  # A platform admin can see all admins for each charity and is able to view options to change the status of an admin.
  # As a platform admin I can manage admins for any charity.

end
