class Seed
  def initialize
    create_categories
    create_nationalities
    create_charities
    create_active_families
    create_past_families
    create_loans
    create_users
    create_roles
    create_admin_user_roles
    create_primary_charity_admins
    create_a_platform_admin
    create_supplies
    create_supply_items
    create_donation_items
  end

  def create_categories
    Category.create(name: "Most Critical", slug: "most-critical")
    Category.create(name: "Elderly",       slug: "elderly")
    Category.create(name: "Children",      slug: "children")
    Category.create(name: "Single Mother", slug: "single-mother")
    Category.create(name: "Middle East",   slug: "middle-east")
    Category.create(name: "East Asia",     slug: "east-asia")
    Category.create(name: "Africa",        slug: "africa")
    Category.create(name: "Latin America", slug: "latin-america")
    Category.create(name: "Loans",         slug: "loans")
    Category.create(name: "Large Family",  slug: "large-family")
    puts "Categories created successfullly"
  end

  def create_nationalities
    nationality1 = Nationality.create(photo_path: "somali_photo.jpeg",
    info_link: "http://www.rescue.org/blog/a-precarious-life"\
    "-somali-refugees-nairobi",
    greeting: "somali_greeting.png",
    name: "Somali")
    nationality2 = Nationality.create(photo_path: "syrian_photo.jpeg",
    info_link: "http://www.rescue.org/crisis-syria-refugees",
    greeting: "syrian_greeting.png",
    name: "Syrian")
    nationality3 = Nationality.create(photo_path: "iraqi_photo.jpeg",
    info_link:    "http://www.rescue.org/blog/iraqi-families-risk-their-lives"\
    "-safety-latest-updates-storify",
    greeting: "iraqi_greeting.png",
    name: "Iraqi")
    nationality4 = Nationality.create(photo_path: "burmese_photo.jpeg",
    info_link: "http://www.rescue.org/blog/border-a-generation-burmese-refugees-"\
    "has-grown-thailand",
    greeting: "burmese_greeting.png",
    name: "Burmese")
    nationality5 = Nationality.create(photo_path: "afghan_photo.jpeg",
    info_link: "http://www.rescue.org/us-program/united-states/welcoming-afghans",
    greeting: "afghan_greeting.png",
    name: "Afghan")
    puts "Nationalities created successfullly"
  end

  def create_charities
    30.times do
      Charity.create!(
                        name:        Faker::Company.name,
                        description: Faker::Lorem.paragraph,
                        status:      [0,1,2].sample
                      )
    end
    puts "Charities created successfullly"
  end

  def create_active_families
    60.times do
      category_ids = (1..10).to_a.sample(2)
      Family.create!(
                      first_name:             Faker::Name.first_name,
                      last_name:              Faker::Name.last_name,
                      arrival_date:           rand(10..30).days.from_now,
                      donation_deadline:      rand(1..10).days.from_now,
                      nationality_id:         rand(1..5),
                      charity_id:             rand(1..30),
                      num_married_adults:     [1,2].sample,
                      num_unmarried_adults:   [0,1,2].sample,
                      num_children_over_two:  rand(0..5),
                      num_children_under_two: rand(0..5),
                      description:            Faker::Lorem.paragraph,
                      category_ids:           category_ids
                    )
    end
    puts "Active families created successfullly"
  end

  def create_past_families
    20.times do
      Family.create!(
                      first_name:             Faker::Name.first_name,
                      last_name:              Faker::Name.last_name,
                      arrival_date:           rand(10..30).days.ago,
                      donation_deadline:      rand(1..10).days.ago,
                      nationality_id:         rand(1..5),
                      charity_id:             rand(1..30),
                      num_married_adults:     [1,2].sample,
                      num_unmarried_adults:   [0,1,2].sample,
                      num_children_over_two:  rand(0..5),
                      num_children_under_two: rand(0..5),
                      description:            Faker::Lorem.paragraph
                    )
    end
    puts "Past families created successfullly"
  end

  def create_loans
    Family.all.each do |family|
      if family.category_ids.include?(9)
        family.loan = Loan.create!(
                                    requested_amount: rand(500..5000),
                                    description:      Faker::Lorem.paragraph,
                                    purpose:          Faker::Company.name,
                                    status:           "active"
                                  )
      end
    end
    puts "Loans created successfullly"
  end

  def create_users
    100.times do
      user = User.create!(
                            username:  Faker::Internet.user_name,
                            password:  Faker::Team.state,
                            cell:      1112223333,
                            email:     Faker::Internet.email,
                          )
      create_donations(user)
    end
  end

  def create_loan_items
    loans = Loan.all
    loans.each do |loan|
      10.times do
        LoanItem.create!(
                          loan_id:     loan.id,
                          donation_id: rand(1..1000),
                          amount:      1
                        )
      end
    end
    puts "loan items created successfullly"
  end

  def create_roles
    Role.create!(name: "platform_admin")
    Role.create!(name: "charity_admin")
    Role.create!(name: "primary_charity_admin")
    puts "Roles created successfullly"
  end

  def create_admin_user_roles
      Charity.all.each do |charity|
        role = Role.find_by(name: "charity_admin")
        5.times do
          user = User.find(Random.new.rand(1..100))
          UserRole.create!(
                            user: user,
                            role: role
                            charity: charity
                          )
        end
      end
    end
    puts "Admin Users created successfullly"
  end

  def create_primary_charity_admins
    Charity.all.each do |charity|
      role = Role.find_by(name: "primary_charity_admin")
      user = User.create!(
                            username:  "primary_ca_#{charity.id}",
                            password:  "password",
                            cell:      1112223333,
                            email:     "nate@turing.io",
                          )
      UserRole.create! (
                        user: user,
                        role: role,
                        charity: charity
                        )
    end
  end

  def create_a_platform_admin
    User.create!(
                  username:  "platform_admin_jorge",
                  password:  "password",
                  cell:      1112223333,
                  email:     "jorge@turing.io",
                )
  end

  def create_donations(user)
    10.times do
      Donation.create(
                        status: ["Cancelled", "Pledged", "Received"].sample,
                        user:   user
                      )
    end
  end

  def create_supplies
    Supply.create(name: "Twin Bedframe",
    value:  30.0,
    description: "New or used.  Used must be in good condition.",
    multiplier_type: "child")
    Supply.create(name: "Twin Mattress",
    value:  100.0,
    description: "Must be new.",
    multiplier_type: "child")
    Supply.create(name: "Full Bedframe",
    value: 50.0,
    description: "New or used. Used must be in good condition.",
    multiplier_type: "adult")
    Supply.create(name: "Full Mattress",
    value: 150.0,
    description: "Must be new.",
    multiplier_type: "adult")
    Supply.create(name: "Dresser",
    value: 50.0,
    description: "New or used.  Used must be in good condition.",
    multiplier_type: "adult")
    Supply.create(name: "Couch",
    value: 100.0,
    description: "New or used.  Used must be in good condition.",
    multiplier_type: "household")
    Supply.create(name: "Kitchen Table",
    value: 40.0,
    description: "New or used.  Used must be in good condition.",
    multiplier_type: "household")
    Supply.create(name: "Large Pot",
    value: 3.0,
    description: "New or used.",
    multiplier_type: "household")
    Supply.create(name: "Small Pot",
    value: 3.0,
    description: "New or used.",
    multiplier_type: "household")
    Supply.create(name: "Kitchen Chair",
    value: 10.0,
    description: "New or used.  Used must be in good condition.",
    multiplier_type: "person")
    Supply.create(name: "Silverware Set",
    value: 1.5,
    description: "New or used. Set consists of fork, spoon and knife.",
    multiplier_type: "person")
    Supply.create(name: "Plate",
    value: 2.0,
    description: "New or used.",
    multiplier_type: "person")
    Supply.create(name: "Crib",
    value: 50.0,
    description:"New or used.  Used must be in good condition.",
    multiplier_type: "baby")
    Supply.create(name: "Car Seat",
    value: 150.0,
    description: "Must be new.",
    multiplier_type: "baby")
    Supply.create(name: "Stroller",
    value: 50.0,
    description: "New or used.  Used must be in good condition.",
    multiplier_type: "baby")
    Supply.create(name: "Diapers",
    value: 15.0,
    description: "Must be new.",
    multiplier_type: "baby")
    Supply.create(name: "Backpack",
    value: 7.50,
    description:"For school-aged child.  New or used.  Used must be in good"\
    " condition.",
    multiplier_type: "child")
    Supply.create(name: "School Supplies",
    value: 10.0,
    description: "3 notebooks, set of pens, set of pencils. Must be new.",
    multiplier_type: "child")
    puts "Supplies created successfullly"
  end

  def create_supply_items
    Supply.all.each do |supply|
      30.times do
        SupplyItem.create!(
                            supply_id: supply.id,
                            family_id: rand(1..80),
                            quantity: rand(1..4)
                          )
      end
    end
    puts "Supply Items created successfullly"
  end

  def create_donation_items
    200.times do
      DonationItem.create!(
                            quantity: 1,
                            supply_item_id: rand(1..180),
                            donation_id: rand(1..1000)
                          )
    end
    puts "Donation items created successfullly"
  end

Seed.new
