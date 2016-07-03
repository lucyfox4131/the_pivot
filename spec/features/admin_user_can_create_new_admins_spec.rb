require 'rails_helper'

RSpec.feature "primary charity admin updates" do
  scenario "successfully update another admin's contact info" do
    charity = create(:charity)
    primary_admin, admin = create_list(:user, 2)
    role1 = Role.create(name: "charity_original_admin")
    role2 = Role.create(name: "charity_admin")

    primary_admin.roles << role1
    admin.roles << role2
    primary_admin.charities << charity
    admin.charities << charity

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( primary_admin )

    visit admin_dashboard_path

    click_on "Create New Admin"

    expect(page).to have_content("Create New Admin For #{charity.name}")
  end
end
