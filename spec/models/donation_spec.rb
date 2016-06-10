require 'rails_helper'

RSpec.describe Donation, type: :model do
  it {should belong_to(:user)}
  it {should have_many(:donation_items)}

  it "outputs donation date" do
    user1 = User.create(username: "user1", password: "password")
    donation1 = Donation.create(status: 'pledged', user: user1)

    expect(donation1.date.to_s).to eq("2016-06-10")
  end
end
