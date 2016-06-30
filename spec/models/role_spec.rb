require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:cell) }
  it { should validate_presence_of(:email) }

  it { should have_many(:user_roles) }
  it { should have_many(:users) }
end
