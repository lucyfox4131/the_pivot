require 'rails_helper'

RSpec.feature "User can edit profile" do
  scenario "Updates when user enters correct current password" do
    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "x")

    user = User.create(username: "test", password: "password", email: "test@example.com")
    new_username = "new_test"
    new_password = "new_password"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit dashboard_path
    click_on "Update my profile"
    expect(current_path).to eq(edit_user_path(user))

    fill_in("user[username]", with: new_username)
    fill_in("user[current_password]", with: user.password)
    fill_in("user[password]", with: new_password)
    click_on "Update profile"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Your updates have been saved")

    click_on "Logout"

    visit login_path

    fill_in "session[username]", with: new_username
    fill_in "session[password]", with: new_password
    click_on "Login to Account"

    expect(page).to have_content("Hi, #{new_username}")
  end

  scenario "Does not update when user enters incorrect current password" do
    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "x")

    user = User.create(username: "test", password: "password", email: "test@example.com")
    new_username = "new_test"
    new_password = "new_password"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit dashboard_path
    click_on "Update my profile"
    expect(current_path).to eq(edit_user_path(user))

    fill_in("user[username]", with: new_username)
    fill_in("user[current_password]", with: "wrongpassword")
    fill_in("user[password]", with: new_password)
    click_on "Update profile"

    expect(page).to have_content("password is incorrect")
    expect(current_path).to eq(user_path(user))
  end

  scenario "Other user cannot edit user info" do
    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "x")

    user = User.create(username: "test2", password: "password", email: "test@example.com")
    other_user = User.create(username: "test2", password: "password", email: "test@example.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    visit edit_user_path(other_user)
    expect(current_path).to eq(root_path)
  end

  scenario "guest cannot edit user info" do
    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "x")
    user = User.create(username: "test2", password: "password", email: "test@example.com")
    visit edit_user_path(user)
    expect(current_path).to eq(root_path)
  end

  scenario "Admin user cannot edit user info" do
    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "x")

    user = User.create(username: "test2", password: "password", email: "test@example.com")
    admin = User.create(username: "test2", password: "password", role: 1, email: "test@example.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( admin )
    visit edit_user_path(user)
    expect(current_path).to eq(root_path)
  end
end
