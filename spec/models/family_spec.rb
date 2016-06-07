require 'rails_helper'

RSpec.describe Family, type: :model do
  it {should have_many :categories}
end
