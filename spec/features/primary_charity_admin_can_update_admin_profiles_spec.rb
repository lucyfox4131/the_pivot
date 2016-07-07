require 'rails_helper'

RSpec.feature "primary charity admin updates" do
  scenario "successfully update another admin's contact info" do
    charity = create(:charity)
    primary_charity_admin, charity_admin = create_list(:user, 2)
    create(:primary_charity_admin_user_role, user: primary_charity_admin, charity: charity)
    create(:charity_admin_user_role, user: charity_admin, charity: charity)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( primary_charity_admin )

    visit charity_dashboard_path(charity.slug, charity.id)

    within(".form-box") do
      fill_in "Email", with: "new@mail.com"
      fill_in "Cell",  with: "1234567890"
    end

    click_on "Update Admin"

    expect(page).to have_content("Your updates have been saved")

    within(".form-box") do
      expect(page).to have_field("Email", with: "new@mail.com")
    end
  end
end
