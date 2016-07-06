require "rails_helper"

RSpec.feature "platform admin manages families" do
  context "user is logged in as platform admin" do
    scenario "platform admin views families from all charities on dashboard" do
      platform_admin = create(:user)
      create(:platform_admin_user_role, user: platform_admin)
      charity_1, charity_2, charity_3 = create_list(:charity, 3)
      family_1 = create(:family, charity: charity_1)
      family_2 = create(:family, charity: charity_2)
      family_3 = create(:family, charity: charity_3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

      visit admin_dashboard_path

      within(find(".#{charity_1.name}").find(".active-families")) do
        expect(page).to have_content(family_1.last_name)
      end

      within(find(".#{charity_2.name}").find(".active-families")) do
        expect(page).to have_content(family_2.last_name)
      end

      within(find(".#{charity_3.name}").find(".active-families")) do
        expect(page).to have_content(family_3.last_name)
      end
    end
  end

 context "user is logged in as platform admin" do
   scenario "platform admin successfully edits family" do
     platform_admin = create(:user)
     create(:platform_admin_user_role, user: platform_admin)
     charity_1 = create(:charity, status: 1)
     charity_2 = create(:charity, status: 1)
     family_1, family_2, family_3 = create(:family, charity: charity_1)
     family_4 = create(:family, charity: charity_2)

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( platform_admin )

     visit admin_dashboard_path

     within(".#{family_1.last_name}") do
       click_button "Update Family"
     end

     fill_in "Last name", with: "NewLastName"
     click_on "Update Family"

     expect(page).to have_content("Your updates have been saved")

     family_1 = Family.find(1)

     within(".#{family_1.last_name}") do
       expect(page).to have_content("NewLastName")
     end
   end
 end
end
