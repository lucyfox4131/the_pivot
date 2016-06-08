require 'rails_helper'

RSpec.describe CategoryFamily, type: :model do
  it { should belong_to(:family) }
  it { should belong_to(:category) }
end
