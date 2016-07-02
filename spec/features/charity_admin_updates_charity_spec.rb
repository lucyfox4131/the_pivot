require 'rails_helper'

RSpec.feature "Admin updates charity" do
  scenario "sees 'successfully updated' message" do
    charity_admin = create(:user)
    charity = create(:charity)
    role = Role.create(name: "charity_admin")
    UserRole.create(user: charity_admin, charity: charity, role: role)
    family_1, family_2, family_3 = create_list(:family, 3, charity: charity)
    loan = create(:loan, family_id: family_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( charity_admin )

    visit admin_dashboard_path

    expect(page).to have_content(charity.name)

    click_on "Update Charity"

    expect(current_path).to eq(edit_charity_path(charity))

    fill_in "Name", with: "New Name"
    fill_in "Description", with: "Updated description of this charity."
    click_on "Update Charity"

    expect(page).to have_content("Your updates have been saved")
    expect(page).to have_content("New Name")
    expect(page).to have_content("Update Charity")
  end
end
