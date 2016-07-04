require 'rails_helper'

RSpec.describe Nationality, type: :model do
  it { should validate_presence_of(:photo_path) }
  it { should validate_presence_of(:info_link) }
  it { should validate_presence_of(:greeting) }
  it { should validate_presence_of(:name) }

  it { should have_many(:families) }

  it "returns a nationality object" do
    nationality = create(:nationality)

    expect(Nationality.get_random.class).to eq(Nationality)
  end
end
