require 'rails_helper'

RSpec.feature "user can create an account" do
  scenario "they become logged in and see dashboard page" do
    visit login_path
    click_on "Create Account"

    fill_in "Username", with: "Robbie"
    fill_in "Password", with: "password"
    click_on "Create Account"

    expect(page).to have_content "Logged in as Robbie"
    expect(page).to have_content "Dashboard"

    expect(page).to have_content "Logout"
    expect(page).to_not have_content "Login"
  end
end
