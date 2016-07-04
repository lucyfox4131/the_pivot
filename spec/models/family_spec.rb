require 'rails_helper'

RSpec.describe Family, type: :model do
  it { should have_many(:categories) }
  it { should have_many(:category_families) }
  it { should have_many(:supplies) }
  it { should belong_to(:nationality) }
  it { should have_many(:supply_items) }
  it { should have_many(:donation_items) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:arrival_date) }
  it { should validate_presence_of(:num_married_adults) }
  it { should validate_presence_of(:num_unmarried_adults) }
  it { should validate_presence_of(:num_children_over_two) }
  it { should validate_presence_of(:num_children_under_two) }
  it { should validate_presence_of(:donation_deadline) }

  it "returns correct number of people" do
    family = create(:family,  num_married_adults: 2,
                              num_unmarried_adults: 1,
                              num_children_over_two: 2,
                              num_children_under_two: 1)

    expect(family.num_people).to eq(6)
  end

  it "returns correct number of adults" do
    family = create(:family,  num_married_adults: 2,
                              num_unmarried_adults: 1,
                              num_children_over_two: 2,
                              num_children_under_two: 1)


    expect(family.num_adults).to eq(3)
  end

  it "generates correct supply hash for famililes with all features" do
    family = create(:family,  num_married_adults: 2,
                              num_unmarried_adults: 1,
                              num_children_over_two: 2,
                              num_children_under_two: 1)

    expected = {"adult" => 3,
                "person" => 6,
                "household" => 1,
                "baby" => 1,
                "child" => 2,
                "other" => 0}

    expect(family.supply_quantity_hash).to eq(expected)
  end

  it "generates correct supply hash for famililes with all features" do
    family = create(:family,  num_married_adults: 2,
                              num_unmarried_adults: 1,
                              num_children_over_two: 2,
                              num_children_under_two: 1)

    supply1 = create(:supply, multiplier_type: "adult")
    supply2 = create(:supply, multiplier_type: "household")
    supply3 = create(:supply, multiplier_type: "person")
    supply4 = create(:supply, multiplier_type: "baby")
    supply5 = create(:supply, multiplier_type: "child")

    family.create_supply_items

    expect(family.supply_items.count).to eq(5)
    expect(family.supply_items.find_by(supply: supply1).quantity).to eq(3)
    expect(family.supply_items.find_by(supply: supply2).quantity).to eq(1)
    expect(family.supply_items.find_by(supply: supply3).quantity).to eq(6)
    expect(family.supply_items.find_by(supply: supply4).quantity).to eq(1)
    expect(family.supply_items.find_by(supply: supply5).quantity).to eq(2)
  end

  it "returns true if retired and false if not" do
    past_family = create(:family, arrival_date: 10.days.ago)
    current_family = create(:family, arrival_date: 10.days.from_now)

    expect(current_family.retired?).to eq(false)
    expect(past_family.retired?).to eq(true)
  end

  it "generates correct supply hash for famililes with some features" do
    family = create(:family,  num_married_adults: 2,
                              num_unmarried_adults: 1,
                              num_children_over_two: 0,
                              num_children_under_two: 0)

    supply1 = create(:supply, multiplier_type: "adult")
    supply2 = create(:supply, multiplier_type: "household")
    supply3 = create(:supply, multiplier_type: "person")
    supply4 = create(:supply, multiplier_type: "baby")
    supply5 = create(:supply, multiplier_type: "child")

    family.create_supply_items

    expect(family.supply_items.count).to eq(3)
    expect(family.supply_items.find_by(supply: supply1).quantity).to eq(3)
    expect(family.supply_items.find_by(supply: supply2).quantity).to eq(1)
    expect(family.supply_items.find_by(supply: supply3).quantity).to eq(3)
    expect(family.supply_items.find_by(supply: supply4)).to eq(nil)
    expect(family.supply_items.find_by(supply: supply5)).to eq(nil)
  end

  describe "scopes" do
    it "retired returns all families with an arrival date < today// > today" do
      past_family = create(:family, first_name: "TestFirst",
                                    arrival_date: 10.days.ago)

      current_family = create(:family, first_name: "Apple",
                                       arrival_date: 10.days.from_now)

      expect(Family.retired.first.first_name).to eq("TestFirst")
      expect(Family.active.first.first_name).to eq("Apple")
    end
  end

  it "returns donations received" do
    supply_1, supply_2, supply_3 = create_list(:supply, 3)
    user = create(:user)
    donation = create(:donation, status: "Pledged", user: user)
    received_donation = create(:donation, status: "Received", user: user)
    past_family = create(:family, arrival_date: 10.days.ago)
    past_family.create_supply_items

    create(:donation_item, quantity: 1,
                           supply_item: past_family.supply_items.first,
                           donation: received_donation)

    expect(past_family.donations_received[0].donation_id).to eq(2)
  end

  it "outputs accurate percentage donated" do
    create(:supply, value: 10.0, multiplier_type: "person")
    create(:supply, value: 1.5, multiplier_type: "person")
    create(:supply, value: 2.0, multiplier_type: "person")

    user = create(:user)
    donation = create(:donation, status: "Pledged", user: user)
    received_donation = create(:donation, status: "Received", user: user)
    past_family = create(:family, arrival_date: 10.days.ago,
                                  num_married_adults: 2,
                                  num_unmarried_adults: 1,
                                  num_children_over_two: 1,
                                  num_children_under_two: 0)

    past_family.create_supply_items

    received_donation_item = create(:donation_item, quantity: 1,
    supply_item: past_family.supply_items.first, donation: received_donation)

    expect(past_family.percentage_donated).to eq(18)
  end
end
