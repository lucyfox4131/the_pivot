require 'rails_helper'

RSpec.describe Family, type: :model do

  it {should have_many :categories}
  it { should have_many(:categories) }
  it { should have_many(:supplies) }
  it { should belong_to(:nationality) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:arrival_date) }
  it { should validate_presence_of(:num_married_adults) }
  it { should validate_presence_of(:num_unmarried_adults) }
  it { should validate_presence_of(:num_children_over_two) }
  it { should validate_presence_of(:num_children_under_two) }
  it { should validate_presence_of(:donation_deadline) }

  it "returns correct number of people" do
    nationality = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Syrian")
    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 2, num_children_under_two: 1)

    expect(family.num_people).to eq(6)
  end

  it "returns correct number of adults" do
    nationality = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Syrian")
    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 2, num_children_under_two: 1)

    expect(family.num_adults).to eq(3)
  end

  it "generates correct supply hash for famililes with all features" do
    nationality = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Syrian")
    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 2, num_children_under_two: 1)

    expected = {"adult" => 3,
                "person" => 6,
                "household" => 1,
                "baby" => 1,
                "child" => 2,
                "other" => 0}

    expect(family.supply_quantity_hash).to eq(expected)
  end

  it "generates correct supply hash for famililes with all features" do
    nationality = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Syrian")

    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 2, num_children_under_two: 1)

    supply1 =Supply.create(name: "Full Bedframe", value: 50.0, description: "New or used.  Used must be in good condition.", multiplier_type: "adult" )
    supply2 =Supply.create(name: "Couch", value: 100.0, description: "New or used.  Used must be in good condition.", multiplier_type: "household")
    supply3 =Supply.create(name: "Kitchen Chair", value: 10.0, description: "New or used.  Used must be in good condition.", multiplier_type: "person")
    supply4 =Supply.create(name: "Crib", value: 50.0, description:"New or used.  Used must be in good condition.", multiplier_type: "baby")
    supply5 =Supply.create(name: "Backpack", value: 7.50, description:"For school-aged child.  New or used.  Used must be in good condition.", multiplier_type: "child")

    family.create_supply_items

    expect(family.supply_items.count).to eq(5)
    expect(family.supply_items.find_by(supply: supply1).quantity).to eq(3)
    expect(family.supply_items.find_by(supply: supply2).quantity).to eq(1)
    expect(family.supply_items.find_by(supply: supply3).quantity).to eq(6)
    expect(family.supply_items.find_by(supply: supply4).quantity).to eq(1)
    expect(family.supply_items.find_by(supply: supply5).quantity).to eq(2)
  end

  it "generates correct supply hash for famililes with some features" do
    nationality = Nationality.create(photo_path: "x", info_link: "x", greeting: "x", name: "Syrian")
    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)

    supply1 =Supply.create(name: "Full Bedframe", value: 50.0, description: "New or used.  Used must be in good condition.", multiplier_type: "adult" )
    supply2 =Supply.create(name: "Couch", value: 100.0, description: "New or used.  Used must be in good condition.", multiplier_type: "household")
    supply3 =Supply.create(name: "Kitchen Chair", value: 10.0, description: "New or used.  Used must be in good condition.", multiplier_type: "person")
    supply4 =Supply.create(name: "Crib", value: 50.0, description:"New or used.  Used must be in good condition.", multiplier_type: "baby")
    supply5 =Supply.create(name: "Backpack", value: 7.50, description:"For school-aged child.  New or used.  Used must be in good condition.", multiplier_type: "child")

    family.create_supply_items

    expect(family.supply_items.count).to eq(3)
    expect(family.supply_items.find_by(supply: supply1).quantity).to eq(3)
    expect(family.supply_items.find_by(supply: supply2).quantity).to eq(1)
    expect(family.supply_items.find_by(supply: supply3).quantity).to eq(3)
    expect(family.supply_items.find_by(supply: supply4)).to eq(nil)
    expect(family.supply_items.find_by(supply: supply5)).to eq(nil)
  end

end
