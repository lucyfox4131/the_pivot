require 'rails_helper'

RSpec.feature "admin can login" do
  scenario "admin logs in and sees the admin dashboard" do
    user = User.create(username: "admin", password: "password", role: 1, email: "email@example.com")

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_on "Login to Account"

    expect(page).to have_content "Admin Dashboard"
  end

  scenario "admin can see the admin dashboard" do
    # user = User.create(username: "admin", password: "password", role: 1, email: "email@example.com")
    user = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit admin_dashboard_path

    expect(page).to have_content "Admin Dashboard"
  end

  scenario "regular user cannot access admin dashboard and sees 404" do
    # user = User.create(username: "user", password: "password", email: "email@example.com")
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit admin_dashboard_path

    expect(page).to have_content "404"
  end

  scenario "unregistered cannot access admin dashboard and sees 404" do
    visit admin_dashboard_path

    expect(page).to have_content "404"
  end
end
