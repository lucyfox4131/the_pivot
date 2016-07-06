require 'rails_helper'

RSpec.describe UserRole, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:role) }
  it { should belong_to(:charity) }

  scenario "user cannot have more than one role" do
    user = create(:user)
    role = Role.create(name: "primary_charity_admin")
    role2 = Role.create(name: "charity_admin")
    charity, charity_2 = create_list(:charity, 2)

    expect(UserRole.count).to eq(0)
    user_role = UserRole.create(user: user, role: role, charity: charity)
    expect(UserRole.count).to eq(1)
    user_role2 = UserRole.create(user: user, role: role2, charity: charity_2)
    expect(UserRole.count).to eq(1)
  end
end
