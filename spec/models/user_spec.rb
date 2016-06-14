require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:email) }


  it do
    should_not allow_values('aaabbbcccc', '111-222-3333').for(:cell)
  end

  it { should allow_value('1112223333').for(:cell) }

  it { should have_secure_password }
end
