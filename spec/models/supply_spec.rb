require 'rails_helper'

RSpec.describe Supply, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:value) }

  it do
    should validate_inclusion_of(:multiplier_type).
      in_array(["adult", "baby", "child", "household", "person", "other"])
  end

  it { should have_many(:families) }
end
