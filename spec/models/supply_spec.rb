require 'rails_helper'

RSpec.describe Supply, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:value) }

  it { should have_many(:families) }
end
