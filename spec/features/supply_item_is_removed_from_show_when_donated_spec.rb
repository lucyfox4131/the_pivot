require 'rails_helper'

RSpec.feature  "family list show correct items needed when donations made" do
  scenario "item removed when fully donated" do
    user = User.create(username: "user1", password: "password", email: "email@example.com")
    nationality1 = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "x")
    fam1 = Family.create(first_name: "x",
      last_name: "x",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality_id: nationality1.id,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 1,
      num_children_under_two: 0)
    supply = Supply.create(name: "Twin Bedframe",
      value:  30.0,
      description: "Sample.",
      multiplier_type: "child"  )
    supply_item = SupplyItem.create(family: fam1, supply: supply, quantity: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return( user )

    visit family_path(fam1)
    expect(page).to have_content("Twin Bedframe")
    within(".Twin") do
      click_on "add to cart"
    end

    visit cart_index_path
    click_on "Checkout"
    click_on "Confirm Donation"
    visit family_path(fam1)

    expect(page).to_not have_content("Twin Bedframe")
  end

  scenario "selector reduced when partially donated" do
    user = User.create(username: "user1", password: "password", email: "email@example.com")
    nationality1 = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "x")
    fam1 = Family.create(first_name: "x",
      last_name: "x",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality_id: nationality1.id,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 1,
      num_children_under_two: 0)
    supply = Supply.create(name: "Twin Bedframe",
      value:  30.0,
      description: "Sample.",
      multiplier_type: "child")
    supply_item = SupplyItem.create(family: fam1, supply: supply, quantity: 3)
    donation = Donation.create(status: "Pledged", user: user)
    donation_item = DonationItem.create(quantity: 1,
      supply_item: fam1.supply_items.first,
      donation: donation)

    visit family_path(fam1)
    within(".Twin") do
      expect(page).to have_select("supply_item[quantity]", options: ["1", "2"])
      expect(page).to_not have_select("supply_item[quantity]",
        options: ["1", "2", "3"])
    end
  end
end
