require 'rails_helper'

RSpec.describe Donation, type: :model do
  it {should belong_to(:user)}
  it {should have_many(:donation_items)}

end
