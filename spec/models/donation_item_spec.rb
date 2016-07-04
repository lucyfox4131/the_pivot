require 'rails_helper'

RSpec.describe DonationItem, type: :model do
  it {should belong_to(:donation)}
  it {should belong_to(:supply_item)}

  it "associates donations and donation items with users" do
    user = create(:user)
    supply = create(:supply, name: "Small Pot", value: 3.0)
    family = create(:family, first_name: "First")

    supply_item = create(:supply_item, supply: supply, quantity: 3, family: family)

    donation = create(:donation, user: user)
    donation_item = create(:donation_item, quantity: 2,
      supply_item: supply_item,
      donation: donation)

    expect(user.donations.count).to eq(1)
    expect(user.donation_items.count).to eq(1)
    expect(user.donation_items.first.supply_item.name).to eq("Small Pot")
    expect(user.donation_items.first.supply_item.family.first_name).to eq("First")
  end

  it "outputs appropriate family nationality/size/description for donation item" do
    user = create(:user)
    nationality = create(:nationality, name: "Somali")
    family = create(:family,  nationality: nationality,
                              num_married_adults: 2,
                              num_unmarried_adults: 1,
                              num_children_over_two: 0,
                              num_children_under_two: 0)
    supply = create(:supply)
    supply_item = create(:supply_item, supply: supply, quantity: 3, family: family)
    donation = create(:donation, user: user)
    donation_item = create(:donation_item, quantity: 1,
      supply_item: family.supply_items.first,
      donation: donation)

    expect(donation_item.family_nationality).to eq("Somali")
    expect(donation_item.family_size).to eq(3)
    expect(donation_item.family_description).to eq("Somali family of 3")
  end

  it "outputs supply name of donation_item" do
    user = create(:user)
    family = create(:family)
    supply = create(:supply, name: "Full Bedframe")
    supply_item = create(:supply_item, supply: supply, quantity: 3, family: family)
    donation = create(:donation, user: user)
    donation_item = create(:donation_item, quantity: 1,
      supply_item: family.supply_items.first,
      donation: donation)

    expect(donation_item.name).to eq("Full Bedframe")
  end

  it "returns correct family nationality" do
    user = create(:user)
    nationality = create(:nationality, name: "Somali")
    family = create(:family, nationality: nationality)
    supply = create(:supply)
    supply_item = create(:supply_item, supply: supply, quantity: 3, family: family)
    donation = create(:donation, user: user)
    donation_item = create(:donation_item, supply_item: supply_item,
                                           donation: donation)

    expect(donation_item.family_nationality).to eq("Somali")
  end

  it "returns correct family size" do
    user = create(:user)
    family = create(:family,  num_married_adults: 2,
                              num_unmarried_adults: 1,
                              num_children_over_two: 0,
                              num_children_under_two: 0)
    supply = create(:supply)
    supply_item = create(:supply_item, supply: supply, quantity: 3, family: family)
    donation = create(:donation, user: user)
    donation_item = create(:donation_item, supply_item: supply_item,
                                           donation: donation)

    expect(donation_item.family_size).to eq(3)
  end

  it "returns correct family description" do
      user = create(:user)
      nationality = create(:nationality, name: "Somali")
      family = create(:family,  nationality: nationality,
                                num_married_adults: 2,
                                num_unmarried_adults: 1,
                                num_children_over_two: 0,
                                num_children_under_two: 0)
      supply = create(:supply)
      supply_item = create(:supply_item, supply: supply, family: family)
      donation = create(:donation, user: user)
      donation_item = create(:donation_item, supply_item: supply_item,
                                             donation: donation)

      expect(donation_item.family_description).to eq("Somali family of 3")
  end

  it "returns correct item name" do
      user = create(:user)
      family = create(:family)
      supply = create(:supply, name: "Small Pot")
      supply_item = create(:supply_item, supply: supply, family: family)
      donation = create(:donation, user: user)
      donation_item = create(:donation_item, supply_item: supply_item,
                                             donation: donation)
      expect(donation_item.name).to eq("Small Pot")
  end

  it "returns correct item value" do
    user = create(:user)
    family = create(:family)
    supply = create(:supply, value: 3.0)
    supply_item = create(:supply_item, supply: supply, family: family)
    donation = create(:donation, user: user)
    donation_item = create(:donation_item, supply_item: supply_item,
                                           donation: donation)

    expect(donation_item.value).to eq(3.0)
  end

  it "returns correct item subtotal" do
      user = create(:user)
      family = create(:family)
      supply = create(:supply, value: "3")
      supply_item = create(:supply_item, supply: supply, family: family)
      donation = create(:donation, user: user)
      donation_item = create(:donation_item, quantity: 2,
                                             supply_item: supply_item,
                                             donation: donation)
      expect(donation_item.subtotal).to eq(6.0)
  end

  it "outputs correct family object" do
    user = create(:user)
    family = create(:family, first_name: "TestFirst")
    supply = create(:supply)
    supply_item = create(:supply_item, supply: supply, family: family)
    donation = create(:donation, user: user)
    donation_item = create(:donation_item, supply_item: supply_item,
                                           donation: donation)

    expect(donation_item.family.first_name).to eq("TestFirst")
  end

  it "returns correct total items" do
    supply = create(:supply)
    family = create(:family)
    supply_item = create(:supply_item)
    donation = create(:donation)

    donation_item_1 = create(:donation_item, quantity: 2,
      supply_item: supply_item,
      donation: donation)

    donation_item_2 = create(:donation_item, quantity: 3,
      supply_item: supply_item,
      donation: donation)

    expect(DonationItem.total_items).to eq(5)
  end
end
