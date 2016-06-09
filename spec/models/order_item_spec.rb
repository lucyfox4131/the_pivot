require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it {should belong_to(:order)}
  it {should belong_to(:supply_item)}

  it "associates orders and order items with users" do
    user = User.create(username: "TestUser", password: "password")
    supply = Supply.create(name: "Small Pot", value: 3.0, description: "New or used.", multiplier_type: "household")

    nationality = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif" ,info_link: "Somali", greeting: "most-critical", name: "Somali")

    family = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality: nationality, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)

    supply_item = SupplyItem.create(supply: supply, quantity: 3, family: family)

    order = Order.create(status: 'pledged', user: user)
    order_item = OrderItem.create(quantity: 2, supply_item: supply_item, order: order)

    expect(user.orders.count).to eq(1)
    expect(user.order_items.count).to eq(1)
    expect(user.order_items.first.supply_item.supply.name).to eq("Small Pot")
    expect(user.order_items.first.supply_item.family.first_name).to eq("TestFirst")

  end

end
