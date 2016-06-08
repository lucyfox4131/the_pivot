require 'rails_helper'

RSpec.describe SupplyItem, type: :model do
  it { should belong_to(:supply) }
  it { should belong_to(:family) }
end
