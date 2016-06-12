require 'rails_helper'

RSpec.describe DonationItem, type: :model do
  it {should belong_to(:donation)}
  it {should belong_to(:supply_item)}

  it "associates donations and donation items with users" do
    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot",
      value: 3.0,
      description: "New or used.",
      multiplier_type: "household")

    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")

    family = Family.create(first_name: "First",
      last_name: "Last",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality: nationality,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 0,
      num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: 'Pledged', user: user)
    donation_item = DonationItem.create(quantity: 2,
      supply_item: supply_item,
      donation: donation)

    expect(user.donations.count).to eq(1)
    expect(user.donation_items.count).to eq(1)
    expect(user.donation_items.first.supply_item.name).to eq("Small Pot")
    expect(user.donation_items.first.supply_item.family.first_name).to eq("First")
  end

  it "outputs approprite family nationality//size//description for donation item" do
    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")
    family1 = Family.create(first_name: "TestFirst",
      last_name: "TestLast",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality_id: nationality1.id,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 0,
      num_children_under_two: 0)
    Supply.create(name: "Full Bedframe",
      value: 50.0,
      description: "New or used.  Used must be in good condition.",
      multiplier_type: "adult")
    family1.create_supply_items
    user1 = User.create(username: "user1", password: "password")
    donation1 = Donation.create(status: 'pledged', user: user1)
    donation_item1 = DonationItem.create(quantity: 1,
      supply_item: family1.supply_items.first,
      donation: donation1)

    expect(donation_item1.family_nationality).to eq("Somali")
    expect(donation_item1.family_size).to eq(3)
    expect(donation_item1.family_description).to eq("Somali family of 3")
  end

  it "outputs supply name of donation_item" do
    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")
    family1 = Family.create(first_name: "TestFirst",
      last_name: "TestLast",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality_id: nationality1.id,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 0,
      num_children_under_two: 0)
    Supply.create(name: "Full Bedframe",
      value: 50.0,
      description: "New or used.  Used must be in good condition.",
      multiplier_type: "adult" )
    family1.create_supply_items
    user1 = User.create(username: "user1", password: "password")
    donation1 = Donation.create(status: 'pledged', user: user1)
    donation_item1 = DonationItem.create(quantity: 1,
      supply_item: family1.supply_items.first,
      donation: donation1)

    expect(donation_item1.name).to eq("Full Bedframe")
  end

  it "returns correct family nationality" do
    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot",
      value: 3.0,
      description: "New or used.",
      multiplier_type: "household")

    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")

    family = Family.create(first_name: "TestFirst",
      last_name: "TestLast",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality: nationality,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 0,
      num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: 'Pledged', user: user)
    donation_item = DonationItem.create(quantity: 2,
      supply_item: supply_item,
      donation: donation)

    expect(donation_item.family_nationality).to eq("Somali")
  end

  it "returns correct family size" do
    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot", value: 3.0, description: "New or used.", multiplier_type: "household")

    nationality = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif" ,info_link: "Somali", greeting: "most-critical", name: "Somali")

    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: 'Pledged', user: user)
    donation_item = DonationItem.create(quantity: 2, supply_item: supply_item, donation: donation)

    expect(donation_item.family_size).to eq(3)
  end

  it "returns correct family description" do
    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot",
      value: 3.0,
      description: "New or used.",
      multiplier_type: "household")

    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")

    family = Family.create(first_name: "TestFirst",
      last_name: "TestLast",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality: nationality,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 0,
      num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: 'Pledged', user: user)
    donation_item = DonationItem.create(quantity: 2,
      supply_item: supply_item,
      donation: donation)

    expect(donation_item.family_description).to eq("Somali family of 3")
  end


  it "returns correct item name" do
    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot",
      value: 3.0,
      description: "New or used.",
      multiplier_type: "household")

    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")

    family = Family.create(first_name: "TestFirst",
      last_name: "TestLast",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality: nationality,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 0,
      num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: 'Pledged', user: user)
    donation_item = DonationItem.create(quantity: 2,
      supply_item: supply_item,
      donation: donation)

    expect(donation_item.name).to eq("Small Pot")
  end

  it "returns correct item value" do
    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot",
      value: 3.0,
      description: "New or used.",
      multiplier_type: "household")

    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")

    family = Family.create(first_name: "TestFirst",
      last_name: "TestLast",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality: nationality,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 0,
      num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: 'Pledged', user: user)
    donation_item = DonationItem.create(quantity: 2,
      supply_item: supply_item,
      donation: donation)

    expect(donation_item.value).to eq(3.0)
  end

  it "returns correct item subtotal" do
    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot",
      value: 3.0,
      description: "New or used.",
      multiplier_type: "household")

      nationality = Nationality.create(photo_path: "x",
        info_link: "x",
        greeting: "x",
        name: "Somali")

    family = Family.create(first_name: "TestFirst",
      last_name: "TestLast",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality: nationality,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 0,
      num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    donation = Donation.create(status: 'Pledged', user: user)
    donation_item = DonationItem.create(quantity: 2,
      supply_item: supply_item,
      donation: donation)

    expect(donation_item.subtotal).to eq(6.0)
  end
end
