require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "adds//deletes an item to and from the cart" do
    supply  = create(:supply)
    supply2 = create(:supply, name: "Twin Mattress")

    cart = Cart.new({})
    cart.add_cart_item(supply.id, 1)

    expect(cart.contents).to eq({"1" => 1})

    cart.add_cart_item(supply2.id, 2)

    expect(cart.contents).to eq({"1"=>1, "2"=>2})

    cart.delete_cart_item(supply2.id)

    expect(cart.contents).to eq({"1"=>1})
  end

  it "can add a loan to the cart" do
    family = create(:family)
    loan = create(:loan)
    cart = Cart.new({})
    cart.add_cart_item(loan, 15)
    expect(cart.contents).to eq("#{loan.purpose}, #{loan.id}" => 15)
  end

  it "can delete a loan from the cart" do
    family = create(:family)
    loan = create(:loan)
    cart = Cart.new({"#{loan.purpose}, #{loan.id}" => 15})
    cart.delete_cart_item(loan)
    expect(cart.contents).to eq({})
  end

  it "changes item quantity from the cart" do
    supply_item1 = Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child")

    cart = Cart.new({})
    cart.add_cart_item(supply_item1.id, 3)

    expect(cart.contents).to eq({"1"=>3})

    cart.change_cart_item_quantity("1", 1)

    expect(cart.contents).to eq({"1"=>1})

    cart.change_cart_item_quantity("1", 6)

    expect(cart.contents).to eq({"1"=>6})
  end

  it "changes loan quantity from cart" do
    family = create(:family)
    loan = create(:loan)

    cart = Cart.new({})
    cart.add_cart_item(loan, 30)

    expect(cart.contents).to eq({"#{loan.purpose}, #{loan.id}"=> 30})

    cart.change_cart_item_quantity("#{loan.purpose}, #{loan.id}", 15)

    expect(cart.contents).to eq({"#{loan.purpose}, #{loan.id}"=> 15})

    cart.change_cart_item_quantity("#{loan.purpose}, #{loan.id}", 65)

    expect(cart.contents).to eq({"#{loan.purpose}, #{loan.id}"=> 65})
  end

  it "knows total items with supplies and loans in cart" do
    supply_item = Supply.create(name: "Twin Bedframe", value:  30.0, description: "New or used.  Used must be in good condition.", multiplier_type: "child")
    supply_item1 = Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child")
    nationality1 = create(:nationality)
    family1 = create(:family)
    loan = create(:loan)
    family1.create_supply_items

    cart = Cart.new({"#{supply_item.id}" => 1, "#{supply_item1.id}" => 2, "#{loan.purpose}, #{loan.id}" => 30})

    expect(cart.total_items).to eq(4)
  end

  it "knows total price of cart with loans and supplies" do
    supply_item = Supply.create(name: "Twin Bedframe", value:  30.0, description: "New or used.  Used must be in good condition.", multiplier_type: "child")
    family1 = create(:family)
    loan = create(:loan)
    family1.create_supply_items

    cart = Cart.new({"#{supply_item.id}" => 1, "#{loan.purpose}, #{loan.id}" => 30})

    expect(cart.total_price).to eq(60.0)
  end

  it "outputs accurate number for total items//price in cart" do
    supply_item = Supply.create(name: "Twin Bedframe", value:  30.0, description: "New or used.  Used must be in good condition.", multiplier_type: "child")
    supply_item1 = Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child")
    nationality1 = Nationality.create(photo_path: "somali_photo.jpeg",
    info_link: "http://www.rescue.org/blog/a-precarious-life"\
    "-somali-refugees-nairobi",
    greeting: "somali_greeting.png", name: "Somali")
    family1 = Family.create(first_name: "TestFirst", last_name: "TestLast",
    arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now,
    nationality_id: nationality1.id, num_married_adults: 2,
    num_unmarried_adults: 1, num_children_over_two: 1, num_children_under_two: 0,
    description: "This married couple fled Somalia in 2001 with their sone and"\
    " the wife's elderly mother.  They have lived in Dadaab refugee camp for"\
    " the past 15 years.")

    family1.create_supply_items

    cart = Cart.new({})
    cart.add_cart_item(supply_item.id, 1)
    cart.add_cart_item(supply_item1.id, 2)

    expect(cart.total_items).to eq(3)
    expect(cart.total_price).to eq(230.0)
  end

  it "finds supply items" do
    nationality1 = Nationality.create(photo_path: "x",
    info_link: "x",
    greeting: "x", name: "Somali")
    family1 = Family.create(first_name: "TestFirst", last_name: "TestLast",
    arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now,
    nationality_id: nationality1.id, num_married_adults: 2,
    num_unmarried_adults: 1, num_children_over_two: 1, num_children_under_two: 0,
    description: "x")
    supply = Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child")
    supply_item = supply.supply_items.create(family: family1, quantity: 4)
    loan = create(:loan)

    cart = Cart.new({"#{loan.purpose}, #{loan.id}" => 30})
    cart.add_cart_item(supply_item.id, 2)

    expect(cart.get_supply_items.first.supply_item).to eq(supply_item)
    expect(cart.get_supply_items.first.quantity).to eq(2)
  end

  it "gets loan items with loans and supplies in cart" do
    nationality1 = Nationality.create(photo_path: "x",
    info_link: "x",
    greeting: "x", name: "Somali")
    family1 = Family.create(first_name: "TestFirst", last_name: "TestLast",
    arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now,
    nationality_id: nationality1.id, num_married_adults: 2,
    num_unmarried_adults: 1, num_children_over_two: 1, num_children_under_two: 0,
    description: "x")
    supply = Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child")
    supply_item = supply.supply_items.create(family: family1, quantity: 4)
    loan = create(:loan)

    cart = Cart.new({"#{loan.purpose}, #{loan.id}" => 30})
    cart.add_cart_item(supply_item.id, 2)

    expect(cart.get_loan_items.count).to eq(1)
    expect(cart.get_loan_items.first.class).to eq(Loan)
  end
end
