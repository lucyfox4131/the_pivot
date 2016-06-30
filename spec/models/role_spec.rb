require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should validate_presence_of(:name) }

  it { should have_many(:user_roles) }
  it { should have_many(:users) }
end
