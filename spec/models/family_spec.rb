require 'rails_helper'

RSpec.describe Family, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:arrival_date) }
  it { should validate_presence_of(:num_married_adults) }
  it { should validate_presence_of(:num_unmarried_adults) }
  it { should validate_presence_of(:num_children_over_two) }
  it { should validate_presence_of(:num_children_under_two) }
  it { should validate_presence_of(:donation_deadline) }

  it { should have_many(:categories) }
  it { should have_many(:supplies) }
  it { should belong_to(:nationality) }
end
