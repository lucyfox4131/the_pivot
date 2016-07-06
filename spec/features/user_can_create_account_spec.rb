require 'rails_helper'

RSpec.feature "user can create an account" do
  scenario "user is logged in and sees dashboard page" do
    visit login_path
    click_on "Create Account"

    within(".panel-body") do
      fill_in "Username", with: "Robbie"
      fill_in "Password", with: "password"
      fill_in "Email", with: "email@example.com"
      fill_in "Cell", with: "1112223333"
      click_on "Create Account"
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content "Logged in as Robbie"

    expect(page).to have_content "Logout"
    expect(page).to_not have_content "Login"
  end

  scenario "user enters invalid cell and gets error" do
    visit login_path
    click_on "Create Account"

    within(".panel-body") do
      fill_in "Username", with: "Robbie"
      fill_in "Password", with: "password"
      fill_in "Email", with: "email@example.com"
      fill_in "Cell", with: "111-222-3333"
      click_on "Create Account"
    end

    expect(page).to have_content "Cell was not in correct format"
    expect(page).to_not have_content "Logged in as Robbie"
  end

end
