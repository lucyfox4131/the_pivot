require 'rails_helper'

RSpec.describe Charity, type: :model do
  it { should belong_to(:family) }

  it { should belong_to(:family) }

  it "creates slug" do
    charity = create(:charity)

    expect(charity.create_slug).to eq("")
  end
end
