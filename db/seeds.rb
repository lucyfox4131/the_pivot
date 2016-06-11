# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category1 = Category.create(name: "Most Critical", slug: "most-critical")
category2 = Category.create(name: "Elderly", slug: "elderly")
category3 = Category.create(name: "Children", slug: "children")
category4 = Category.create(name: "Single Mother", slug: "single-mother")
category5 = Category.create(name: "Middle East", slug: "middle-east")
category6 = Category.create(name: "East Asia", slug: "east-asia")
category7 = Category.create(name: "Africa", slug: "africa")
category8 = Category.create(name: "Latin America", slug: "latin-america")

nationality1 = Nationality.create(photo_path: "somali_photo.jpeg" , info_link: "http://www.rescue.org/blog/a-precarious-life-somali-refugees-nairobi", greeting: "somali_greeting.png", name: "Somali")
nationality2 = Nationality.create(photo_path: "syrian_photo.jpeg" ,info_link: "http://www.rescue.org/crisis-syria-refugees", greeting: "syrian_greeting.png", name: "Syrian")
nationality3 = Nationality.create(photo_path: "iraqi_photo.jpeg" ,info_link: "http://www.rescue.org/blog/iraqi-families-risk-their-lives-safety-latest-updates-storify", greeting: "iraqi_greeting.png", name: "Iraqi")
nationality4 = Nationality.create(photo_path: "burmese_photo.jpeg" ,info_link: "http://www.rescue.org/blog/border-a-generation-burmese-refugees-has-grown-thailand", greeting: "burmese_greeting.png",  name: "Burmese")
nationality5 = Nationality.create(photo_path: "afghan_photo.jpeg" ,info_link: "http://www.rescue.org/us-program/united-states/welcoming-afghans", greeting: "afghan_greeting.png", name: "Afghan")

family1 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality1.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 1, num_children_under_two: 0, description: "This married couple fled Somalia in 2001 with their sone and the wife's elderly mother.  They have lived in Dadaab refugee camp for the past 15 years.")
family2 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality2.id, num_married_adults: 4, num_unmarried_adults: 0, num_children_over_two: 0, num_children_under_two: 1, description: "This elderly couple, their adult daughter and her three children fled Allepo in 2012.")
family3 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality3.id, num_married_adults: 2, num_unmarried_adults: 0, num_children_over_two: 1, num_children_under_two: 1, description: "This family fled Fallujah in 2014.  The are reuniting with the husband's brother, who was previously resettled in the US.")
family4 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality4.id, num_married_adults: 0, num_unmarried_adults: 1, num_children_over_two: 3, num_children_under_two: 0, description: "This single mother has spent her entire life in a refugee camp on the Thai-Burma border.  She is reuniting with her mother who was previously resettled in the US.")
family5 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality5.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0, description: "The husband in this family served as an interprter for the US Army.  He is resettling in the US with his wife and adult son.")



past_family1 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.ago, donation_deadline: 15.days.ago, nationality_id: nationality1.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 1, num_children_under_two: 0, description: "This married couple fled Somalia in 2001 with their sone and the wife's elderly mother.  They have lived in Dadaab refugee camp for the past 15 years.")
past_family2 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.ago, donation_deadline: 15.days.ago, nationality_id: nationality2.id, num_married_adults: 4, num_unmarried_adults: 0, num_children_over_two: 0, num_children_under_two: 1, description: "This elderly couple, their adult daughter and her three children fled Allepo in 2012.")
past_family3 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.ago, donation_deadline: 15.days.ago, nationality_id: nationality3.id, num_married_adults: 2, num_unmarried_adults: 0, num_children_over_two: 1, num_children_under_two: 1, description: "This family fled Fallujah in 2014.  The are reuniting with the husband's brother, who was previously resettled in the US.")
past_family4 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.ago, donation_deadline: 15.days.ago, nationality_id: nationality4.id, num_married_adults: 0, num_unmarried_adults: 1, num_children_over_two: 3, num_children_under_two: 0, description: "This single mother has spent her entire life in a refugee camp on the Thai-Burma border.  She is reuniting with her mother who was previously resettled in the US.")
past_family5 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.ago, donation_deadline: 15.days.ago, nationality_id: nationality5.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0, description: "The husband in this family served as an interprter for the US Army.  He is resettling in the US with his wife and adult son.")

family1.categories << [category1, category2, category3, category7]
family2.categories << [category3, category2, category5]
family3.categories << [category5, category3]
family4.categories << [category6, category4]
family5.categories << [category3]

Supply.create(name: "Twin Bedframe", value:  30.0, description: "New or used.  Used must be in good condition.", multiplier_type: "child"  )
Supply.create(name: "Twin Mattress", value:  100.0, description: "Must be new.", multiplier_type: "child" )

Supply.create(name: "Full Bedframe", value: 50.0, description: "New or used.  Used must be in good condition.", multiplier_type: "adult" )
Supply.create(name: "Full Mattress", value: 150.0, description: "Must be new.", multiplier_type: "adult" )
Supply.create(name: "Dresser", value: 50.0, description: "New or used.  Used must be in good condition.", multiplier_type: "adult")

Supply.create(name: "Couch", value: 100.0, description: "New or used.  Used must be in good condition.", multiplier_type: "household")
Supply.create(name: "Kitchen Table", value: 40.0, description: "New or used.  Used must be in good condition.", multiplier_type: "household")
Supply.create(name: "Large Pot", value: 3.0, description: "New or used.", multiplier_type: "household")
Supply.create(name: "Small Pot", value: 3.0, description: "New or used.", multiplier_type: "household")


Supply.create(name: "Kitchen Chair", value: 10.0, description: "New or used.  Used must be in good condition.", multiplier_type: "person")
Supply.create(name: "Silverware Set", value: 1.5, description: "New or used. Set consists of fork, spoon and knife.", multiplier_type: "person")
Supply.create(name: "Plate", value: 2.0, description: "New or used.", multiplier_type: "person")

Supply.create(name: "Crib", value: 50.0, description:"New or used.  Used must be in good condition.", multiplier_type: "baby")
Supply.create(name: "Car Seat", value: 150.0, description: "Must be new.", multiplier_type: "baby")
Supply.create(name: "Stroller", value: 50.0, description: "New or used.  Used must be in good condition.", multiplier_type: "baby")
Supply.create(name: "Diapers", value: 15.0, description: "Must be new.", multiplier_type: "baby")

Supply.create(name: "Backpack", value: 7.50, description:"For school-aged child.  New or used.  Used must be in good condition.", multiplier_type: "child")
Supply.create(name: "School Supplies", value: 10.0, description: "3 notebooks, set of pens, set of pencils. Must be new.", multiplier_type: "child")

family1.create_supply_items
family2.create_supply_items
family3.create_supply_items
family4.create_supply_items
family5.create_supply_items

user1 = User.create(username: "user1", password: "password")
user2 = User.create(username: "user2", password: "password")
user3 = User.create(username: "admin", password: "password", role: 1)

donation1 = Donation.create(status: "Pledged", user: user1)
donation2 = Donation.create(status: "Received", user: user1)
donation3 = Donation.create(status: "Cancelled", user: user2)

donation_item1 = DonationItem.create(quantity: 1, supply_item: family1.supply_items.first, donation: donation1)

donation_item2 = DonationItem.create(quantity: 1, supply_item: family2.supply_items.last, donation: donation1)

donation_item3 = DonationItem.create(quantity: 1, supply_item: family3.supply_items.first, donation: donation2)

donation_item4 = DonationItem.create(quantity: 1, supply_item: family4.supply_items.first, donation: donation3)
