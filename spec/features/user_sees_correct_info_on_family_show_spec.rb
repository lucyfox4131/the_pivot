require 'rails_helper'

RSpec.feature "user can view all families" do

  scenario "they see a form for family that will arrive" do

    nationality = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")

    family = Family.create(first_name: "First1",
      last_name: "Last1",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality: nationality,
      num_married_adults: 2,
      num_unmarried_adults: 0,
      num_children_over_two: 2,
      num_children_under_two: 0)

    supply = Supply.create(name: "School Supplies",
      value: 10.0,
      description: "3 notebooks, set of pens, set of pencils. Must be new.",
      multiplier_type: "child")

    family.supply_items.create(supply: supply, quantity: 2)

    visit family_path(family)
    expect(page).to_not have_content("Family Arrived")
    expect(page).to have_content(family.arrival_date.to_formatted_s(:long))
    expect(page).to have_content("Donate by:")
    expect(page).to have_button("add to cart")

  end

  scenario "they see list of donations for family that already arrived" do

      nationality = Nationality.create(photo_path: "x",
        info_link: "x",
        greeting: "x",
        name: "Somali")

      family = Family.create(first_name: "TestFirst",
        last_name: "TestLast",
        arrival_date: 10.days.ago,
        donation_deadline: 15.days.ago,
        nationality: nationality,
        num_married_adults: 2,
        num_unmarried_adults: 1,
        num_children_over_two: 1,
        num_children_under_two: 0)

        supply = Supply.create(name: "School Supplies",
          value: 10.0,
          description: "3 notebooks, set of pens, set of pencils. Must be new.",
          multiplier_type: "child")

        family.supply_items.create(supply: supply)

        user = User.create(username: "user1", password: "password")

        donation = Donation.create(status: "Received", user: user)

        donation_item1 = DonationItem.create(quantity: 1,
          supply_item: family.supply_items.first,
          donation: donation)

        visit family_path(family)
        expect(page).to have_content("Family Arrived")
        expect(page).to_not have_content(family.arrival_date.to_formatted_s(:long))
        expect(page).to_not have_content("Donate by:")
        expect(page).to_not have_button("add to cart")
        expect(page).to have_content("Donated Item")
        expect(page).to have_content(donation.created_at.to_formatted_s(:long))
        expect(page).to have_content("School Supplies")

      end
    end
