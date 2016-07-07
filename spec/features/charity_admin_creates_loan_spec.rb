require 'rails_helper'

RSpec.feature "Admin creates loan for family" do
  scenario "admin sees loan under family" do
    charity_admin = create(:user)
    charity = create(:charity)
    create(:charity_admin_user_role, user: charity_admin, charity: charity)
    family = create(:family)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( charity_admin )

    visit admin_families_path

    within(".row-nationality-active") do
      click_link "Add Loan"
    end

    expect(current_path).to eq(new_loan_path)

    within(".panel-body") do
      fill_in "Requested amount", with: "1000.00"
      fill_in "Purpose", with: "This is a purpose"
      fill_in "Description", with: "This is a loan description"
      select "active", from: "Status"
      click_on "Create Loan"
    end

    expect(current_path).to eq(admin_families_path)

    expect(page).to have_content("Loan Created Successfully")
  end

  scenario "non-admin cannot create loan for family" do
    user = create(:user)
    charity = create(:charity)
    family = create(:family)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit admin_families_path

    expect(page).to have_content("404")

    visit new_loan_path

    expect(page).to_not have_content("Add Loan")
    expect(current_path).to eq(root_path)
  end

end
