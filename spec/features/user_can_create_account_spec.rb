require 'rails_helper'

RSpec.feature "user can create an account" do
  scenario "they become logged in and see dashboard page" do
    visit login_path
    click_on "Create Account"

    fill_in "Username", with: "Robbie"
    fill_in "Password", with: "password"
    fill_in "Email", with: "email@example.com"
    fill_in "Cell", with: "1112223333"
    click_on "Create Account"

    expect(page).to have_content "Logged in as Robbie"
    expect(page).to have_content "Dashboard"

    expect(page).to have_content "Logout"
    expect(page).to_not have_content "Login"
  end

  scenario "they enter bad cell and get error" do
    visit login_path
    click_on "Create Account"

    fill_in "Username", with: "Robbie"
    fill_in "Password", with: "password"
    fill_in "Email", with: "email@example.com"
    fill_in "Cell", with: "111-222-3333"
    click_on "Create Account"

    expect(page).to have_content "was not in correct format"
  end

end
