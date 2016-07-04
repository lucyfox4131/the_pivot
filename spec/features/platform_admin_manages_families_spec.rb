require "rails_helper"

RSpec.feature "platform admin manages families" do
  context "user is logged in as platform admin" do
    scenario "platform admin views families from all charities on dashboard" do

    platform_admin = create(:user)
    charity_1, charity_2, charity_3 = create_list(:charity, 3)
    role = Role.create(name: "platform_admin")
    UserRole.create(user: platform_admin, role: role)
    family_1 = create(:family, charity: charity_1)
    family_3 = create(:family, charity: charity_3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

    visit admin_dashboard_path

    expect(page).to have_content(charity_1.slug)
    expect(page).to have_content(charity_2.slug)
    expect(page).to have_content(charity_3.slug)

    expect(page).to have_content(family_1.last_name)
  end
 end

 context "user is logged in as platform admin" do
   scenario "platform admin successfully edits family" do

     platform_admin = create(:user)
     charity_1 = create(:charity, status: 1)
     charity_2 = create(:charity, status: 1)
     role = Role.create(name: "platform_admin")
     UserRole.create(user: platform_admin, role: role)
     family_1, family_2, family_3 = create(:family, charity: charity_1)
     family_4 = create(:family, charity: charity_2)

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

     visit admin_dashboard_path

     within(".#{family_1.last_name}") do
       click_button "Update Family"
     end

     fill_in "Last name", with: "New Last Name"
     click_on "Update Family"

     expect(page).to have_content("Your updates have been saved")
     expect(page).to have_content("New Last Name")
  end
 end
end

# # Make sure a platform admin can see within all charities the ability to edit family and loan information for that specific charity.
