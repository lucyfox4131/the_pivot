require 'rails_helper'

RSpec.feature "User creates new charity" do
  context "user is logged in" do
    scenario "user successfully creates new charity" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit charities_path

      click_button "Apply To Be One of Our Charities"

      expect(page).to have_content("Create a New Charity")
      expect(current_path).to eq(new_charity_path)

      fill_in "Name", with: "Charity Name"
      fill_in "Description", with: "Description of our new charity."
      click_on "Create Charity"

      expect(page).to have_content("Your charity request has been recieved.
                    Once it has been approved it will be visible on our site.")
    end
  end

  context "user is not logged in" do
    scenario "user cannot see an option to create a charity" do
      user = create(:user)

      visit charities_path

      expect(page).to_not have_button("Apply To Be One of Our Charities")
    end
  end
end
