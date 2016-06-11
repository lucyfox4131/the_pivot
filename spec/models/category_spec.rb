require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }

  it { should have_many(:families) }
  it { should have_many(:category_families) }

  it "to param method is functional" do
    category1 = Category.create(name: "Most Critical", slug: "most-critical")

    expect(category1.to_param).to eq("most-critical")
  end
end
