require 'rails_helper'

RSpec.describe Nationality, type: :model do
  it { should validate_presence_of(:photo_path) }
  it { should validate_presence_of(:info_link) }
  it { should validate_presence_of(:greeting) }

  it { should have_many(:families) }
end
