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

family1 = Family.create(first_name: "Abshir",
last_name: "Dalmar",
arrival_date: 10.days.from_now,
donation_deadline: 5.days.from_now,
nationality_id: nationality1.id,
num_married_adults: 2,
num_unmarried_adults: 1,
num_children_over_two: 1,
num_children_under_two: 0,
description: "This married couple fled Somalia in 2001 with their son and"\
" the wife's elderly mother.  They have lived in Dadaab refugee camp for"\
" the past 15 years.",
family_photo: File.new("#{Rails.root}/app/assets/images/generic_family_photo.jpg"))

family2 = Family.create(first_name: "Adnan",
last_name: "Zuabi",
arrival_date: 10.days.from_now,
donation_deadline: 5.days.from_now,
nationality_id: nationality2.id,
num_married_adults: 4,
num_unmarried_adults: 0,
num_children_over_two: 0,
num_children_under_two: 1,
description: "This elderly couple, their adult daughter and her three "\
"children fled Allepo in 2012.")
family3 = Family.create(first_name: "Zainab",
last_name: "Awad",
arrival_date: 10.days.from_now,
donation_deadline: 5.days.from_now,
nationality_id: nationality3.id,
num_married_adults: 2,
num_unmarried_adults: 0,
num_children_over_two: 1,
num_children_under_two: 1,
description: "This family fled Fallujah in 2014.  The are reuniting with the"\
" husband's brother, who was previously resettled in the US.")
family4 = Family.create(first_name: "Maung",
last_name: "San",
arrival_date: 10.days.from_now,
donation_deadline: 5.days.from_now,
nationality_id: nationality4.id,
num_married_adults: 0,
num_unmarried_adults: 1,
num_children_over_two: 3,
num_children_under_two: 0,
description: "This single mother has spent her entire life in a refugee camp"\
" on the Thai-Burma border.  She is reuniting with her mother who was"\
" previously resettled in the US.")
family5 = Family.create(first_name: "Abraham",
last_name: "Nawabi",
arrival_date: 10.days.from_now,
donation_deadline: 5.days.from_now,
nationality_id: nationality5.id,
num_married_adults: 2,
num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0,
description: "The husband in this family served as an interprter for the US"\
" Army.  He is resettling in the US with his wife and adult son.")




family6 = Family.create(first_name: "Kafeeyo",
last_name: "Mahad",
arrival_date: 6.days.from_now,
donation_deadline: 2.days.from_now,
nationality_id: nationality1.id,
num_married_adults: 2,
num_unmarried_adults: 1,
num_children_over_two: 4,
num_children_under_two: 0,
description: "This married couple fled Somalia in 2001 with their sons and"\
" the wife's elderly mother.  They have lived in Dadaab refugee camp for"\
" the past 15 years.")
family7 = Family.create(first_name: "Amena",
last_name: "Azmeh",
arrival_date: 18.days.from_now,
donation_deadline: 10.days.from_now,
nationality_id: nationality2.id,
num_married_adults: 2,
num_unmarried_adults: 1,
num_children_over_two: 2,
num_children_under_two: 1,
description: "This elderly couple, their adult daughter and her three "\
"children fled Allepo in 2012.")
family8 = Family.create(first_name: "Ahmed",
last_name: "Malaki",
arrival_date: 24.days.from_now,
donation_deadline: 12.days.from_now,
nationality_id: nationality3.id,
num_married_adults: 2,
num_unmarried_adults: 0,
num_children_over_two: 2,
num_children_under_two: 2,
description: "This family fled Tikrit in 2012.  The are reuniting with the"\
" wife's mother, who was previously resettled in the US.")
family9 = Family.create(first_name: "Daw",
last_name: "Kyi",
arrival_date: 17.days.from_now,
donation_deadline: 14.days.from_now,
nationality_id: nationality4.id,
num_married_adults: 0,
num_unmarried_adults: 1,
num_children_over_two: 4,
num_children_under_two: 0,
description: "This single mother has spent her entire life in a refugee camp"\
" on the Thai-Burma border.  She is reuniting with her sister who was"\
" previously resettled in the US.")
family10 = Family.create(first_name: "Hajera",
last_name: "Shahnawaz",
arrival_date: 20.days.from_now,
donation_deadline: 15.days.from_now,
nationality_id: nationality5.id,
num_married_adults: 2,
num_unmarried_adults: 2,
num_children_over_two: 0,
num_children_under_two: 0,
description: "The husband in this family served as an interprter for the US"\
" Navy.  He is resettling in the US with his wife and adult sons.")


family11 = Family.create(first_name: "Riyo",
last_name: "Samatar",
arrival_date: 12.days.from_now,
donation_deadline: 7.days.from_now,
nationality_id: nationality1.id,
num_married_adults: 1,
num_unmarried_adults: 1,
num_children_over_two: 1,
num_children_under_two: 0,
description: "These siblings couple fled Somalia in 2005"\
"They have lived in Kakuma refugee camp for"\
" the past 10 years.")
family12 = Family.create(first_name: "Hayyan",
last_name: "Tamer",
arrival_date: 14.days.from_now,
donation_deadline: 10.days.from_now,
nationality_id: nationality2.id,
num_married_adults: 2,
num_unmarried_adults: 0,
num_children_over_two: 1,
num_children_under_two: 0,
description: "This elderly couple and their grandaugter"\
" fled Homs in 2014.")
family13 = Family.create(first_name: "Sami",
last_name: "Hassani",
arrival_date: 16.days.from_now,
donation_deadline: 12.days.from_now,
nationality_id: nationality3.id,
num_married_adults: 2,
num_unmarried_adults: 1,
num_children_over_two: 3,
num_children_under_two: 1,
description: "This family fled Baghdad in 2014.  The are reuniting with the"\
" wife's uncle, who was previously resettled in the US.")
family14 = Family.create(first_name: "Ma",
last_name: "Pu",
arrival_date: 18.days.from_now,
donation_deadline: 14.days.from_now,
nationality_id: nationality4.id,
num_married_adults: 0,
num_unmarried_adults: 1,
num_children_over_two: 1,
num_children_under_two: 0,
description: "This single mother has spent her entire life in a refugee camp"\
" on the Thai-Burma border.  She is reuniting with her mother who was"\
" previously resettled in the US.")
family15 = Family.create(first_name: "Nabil",
last_name: "Ahmadi",
arrival_date: 20.days.from_now,
donation_deadline: 15.days.from_now,
nationality_id: nationality5.id,
num_married_adults: 2,
num_unmarried_adults: 0,
num_children_over_two: 0,
num_children_under_two: 0,
description: "The husband in this family served as an interprter for the US"\
" Navy.  He is resettling in the US with his pregnant wife.")


past_family1 = Family.create(first_name: "Hibaaq",
last_name: "Osman",
arrival_date: 10.days.ago,
donation_deadline: 15.days.ago,
nationality_id: nationality1.id,
num_married_adults: 2,
num_unmarried_adults: 1,
num_children_over_two: 1,
num_children_under_two: 0,
description: "This married couple fled Somalia in 2001 with their son and"\
" the wife's elderly mother.  They have lived in Dadaab refugee camp "\
" for the past 15 years.")

past_family2 = Family.create(first_name: "Ranim",
last_name: "Ismat",
arrival_date: 10.days.ago,
donation_deadline: 15.days.ago,
nationality_id: nationality2.id,
num_married_adults: 4,
num_unmarried_adults: 0,
num_children_over_two: 0,
num_children_under_two: 1,
description: "This elderly couple, their adult daughter and her three "\
"children fled Allepo in 2012.")
past_family3 = Family.create(first_name: "Telenaz",
last_name: "Jamal",
arrival_date: 10.days.ago,
donation_deadline: 15.days.ago,
nationality_id: nationality3.id,
num_married_adults: 2,
num_unmarried_adults: 0,
num_children_over_two: 1,
num_children_under_two: 1,
description: "This family fled Fallujah in 2014.  The are reuniting with the"\
" husband's brother, who was previously resettled in the US.")
past_family4 = Family.create(first_name: "Hayma",
last_name: "Nay Win",
arrival_date: 10.days.ago,
donation_deadline: 15.days.ago,
nationality_id: nationality4.id,
num_married_adults: 0,
num_unmarried_adults: 1,
num_children_over_two: 3,
num_children_under_two: 0,
description: "This single mother has spent her entire life in a refugee camp"\
" on the Thai-Burma border.  She is reuniting with her mother who was"\
" previously resettled in the US.")
past_family5 = Family.create(first_name: "Ramazan",
last_name: "Karzai",
arrival_date: 10.days.ago,
donation_deadline: 15.days.ago,
nationality_id: nationality5.id,
num_married_adults: 2,
num_unmarried_adults: 1,
num_children_over_two: 0,
num_children_under_two: 0,
description: "The husband in this family served as an interprter for the US"\
" Army.  He is resettling in the US with his wife and adult son.")

past_family6 = Family.create(first_name: "Barre",
last_name: "Jibril",
arrival_date: 20.days.ago,
donation_deadline: 25.days.ago,
nationality_id: nationality1.id,
num_married_adults: 2,
num_unmarried_adults: 0,
num_children_over_two: 0,
num_children_under_two: 0,
description: "This married couple fled Somalia in 2010."\
" They have lived in Kakuma refugee camp "\
" for the past 5 years.")

past_family7 = Family.create(first_name: "Elias",
last_name: "Saqqal",
arrival_date: 18.days.ago,
donation_deadline: 20.days.ago,
nationality_id: nationality2.id,
num_married_adults: 6,
num_unmarried_adults: 0,
num_children_over_two: 0,
num_children_under_two: 1,
description: "This elderly couple, their adult daughter, her husband and three "\
"children fled Damascus in 2012.")
past_family8 = Family.create(first_name: "Mohammed",
last_name: "Mustafa",
arrival_date: 16.days.ago,
donation_deadline: 18.days.ago,
nationality_id: nationality3.id,
num_married_adults: 2,
num_unmarried_adults: 0,
num_children_over_two: 4,
num_children_under_two: 1,
description: "This family fled Fallujah in 2014.  The are reuniting with the"\
" husband's mother, who was previously resettled in the US.")
past_family9 = Family.create(first_name: "U",
last_name: "Thant",
arrival_date: 14.days.ago,
donation_deadline: 16.days.ago,
nationality_id: nationality4.id,
num_married_adults: 0,
num_unmarried_adults: 1,
num_children_over_two: 3,
num_children_under_two: 1,
description: "This single father has spent his entire life in a refugee camp"\
" on the Thai-Burma border.  He is reuniting with his brother who was"\
" previously resettled in the US.")
past_family10 = Family.create(first_name: "Tahib",
last_name: "Aziz",
arrival_date: 12.days.ago,
donation_deadline: 14.days.ago,
nationality_id: nationality5.id,
num_married_adults: 2,
num_unmarried_adults: 2,
num_children_over_two: 0,
num_children_under_two: 0,
description: "The husband in this family served as an interprter for the US"\
" Army.  He is resettling in the US with his wife and two adult sons.")

family1.categories << [category1, category2, category3, category7]
family2.categories << [category3, category2, category5]
family3.categories << [category5, category3]
family4.categories << [category6, category4]
family5.categories << [category3]
family6.categories << [category1, category2, category3, category7]
family7.categories << [category3, category2, category5]
family8.categories << [category5, category3]
family9.categories << [category6, category4]
family10.categories << [category3]
family11.categories << [category1, category2, category3, category7]
family12.categories << [category3, category2, category5]
family13.categories << [category5, category3]
family14.categories << [category6, category4]
family15.categories << [category3]


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

family1.create_supply_items
family2.create_supply_items
family3.create_supply_items
family4.create_supply_items
family5.create_supply_items
family6.create_supply_items
family7.create_supply_items
family8.create_supply_items
family9.create_supply_items
family10.create_supply_items
family11.create_supply_items
family12.create_supply_items
family13.create_supply_items
family14.create_supply_items
family15.create_supply_items

past_family1.create_supply_items
past_family2.create_supply_items
past_family3.create_supply_items
past_family4.create_supply_items
past_family5.create_supply_items
past_family6.create_supply_items
past_family7.create_supply_items
past_family8.create_supply_items
past_family9.create_supply_items
past_family10.create_supply_items

user1 = User.create(username: "user1", password: "password", cell: "6825576617", email: "refugeerestore@gmail.com")
user2 = User.create(username: "user2", password: "password", cell: "6197884990", email: "refugeerestore@gmail.com")
user3 = User.create(username: "user3", password: "password", cell: "8472751703", email: "refugeerestore@gmail.com")
user4 = User.create(username: "admin", password: "password", role: 1, email: "refugeerestore@gmail.com")

donation1 = Donation.create(status: "Pledged", user: user1)
donation2 = Donation.create(status: "Received", user: user1)
donation3 = Donation.create(status: "Cancelled", user: user2)
donation4 = Donation.create(status: "Pledged", user: user1)
donation5 = Donation.create(status: "Received", user: user1)
donation6 = Donation.create(status: "Received", user: user2)
donation7 = Donation.create(status: "Received", user: user1)
donation8 = Donation.create(status: "Received", user: user1)
donation9 = Donation.create(status: "Received", user: user2)


received_donation1 = Donation.create(status: "Received", user: user2)
received_donation2 = Donation.create(status: "Received", user: user2)
received_donation3 = Donation.create(status: "Received", user: user2)
received_donation4 = Donation.create(status: "Received", user: user2)

donation_item1 = DonationItem.create(quantity: 3,
supply_item: family1.supply_items[2],
donation: donation1)
donation_item2 = DonationItem.create(quantity: 4,
supply_item: family2.supply_items.first,
donation: donation1)
donation_item3 = DonationItem.create(quantity: 1,
supply_item: family3.supply_items.first,
donation: donation2)
donation_item4 = DonationItem.create(quantity: 1,
supply_item: family4.supply_items[1],
donation: donation3)
donation_item5 = DonationItem.create(quantity: 1,
supply_item: family5.supply_items.first,
donation: donation4)
donation_item6 = DonationItem.create(quantity: 1,
supply_item: family5.supply_items.last,
donation: donation4)
donation_item7 = DonationItem.create(quantity: 1,
supply_item: family6.supply_items.first,
donation: donation5)
donation_item8 = DonationItem.create(quantity: 1,
supply_item: family6.supply_items.last,
donation: donation5)
donation_item9 = DonationItem.create(quantity: 1,
supply_item: family7.supply_items.first,
donation: donation6)
donation_item10 = DonationItem.create(quantity: 1,
supply_item: family7.supply_items.last,
donation: donation7)
donation_item11 = DonationItem.create(quantity: 1,
supply_item: family8.supply_items.first,
donation: donation8)
donation_item12 = DonationItem.create(quantity: 1,
supply_item: family8.supply_items.last,
donation: donation8)
donation_item13 = DonationItem.create(quantity: 1,
supply_item: family7.supply_items[1],
donation: donation6)
donation_item14 = DonationItem.create(quantity: 1,
supply_item: family7.supply_items[2],
donation: donation7)
donation_item15 = DonationItem.create(quantity: 1,
supply_item: family8.supply_items[1],
donation: donation8)
donation_item16 = DonationItem.create(quantity: 1,
supply_item: family8.supply_items[2],
donation: donation9)
donation_item13 = DonationItem.create(quantity: 1,
supply_item: family9.supply_items.first,
donation: donation6)
donation_item14 = DonationItem.create(quantity: 1,
supply_item: family9.supply_items.last,
donation: donation7)
donation_item15 = DonationItem.create(quantity: 1,
supply_item: family10.supply_items[3],
donation: donation8)
donation_item16 = DonationItem.create(quantity: 1,
supply_item: family11.supply_items[2],
donation: donation9)
donation_item13 = DonationItem.create(quantity: 1,
supply_item: family11.supply_items.last,
donation: donation6)
donation_item14 = DonationItem.create(quantity: 1,
supply_item: family12.supply_items[3],
donation: donation7)
donation_item15 = DonationItem.create(quantity: 1,
supply_item: family13.supply_items.first,
donation: donation8)
donation_item16 = DonationItem.create(quantity: 1,
supply_item: family13.supply_items.last,
donation: donation9)
donation_item13 = DonationItem.create(quantity: 1,
supply_item: family14.supply_items[2],
donation: donation6)
donation_item14 = DonationItem.create(quantity: 1,
supply_item: family14.supply_items[3],
donation: donation7)
donation_item15 = DonationItem.create(quantity: 1,
supply_item: family15.supply_items[1],
donation: donation8)
donation_item16 = DonationItem.create(quantity: 1,
supply_item: family15.supply_items.last,
donation: donation9)



received_donation_item1 = DonationItem.create(quantity: 1,
supply_item: past_family1.supply_items.first,
donation: received_donation1)
received_donation_item2 = DonationItem.create(quantity: 1,
supply_item: past_family2.supply_items.first,
donation: received_donation2)
received_donation_item2 = DonationItem.create(quantity: 1,
supply_item: past_family2.supply_items[2],
donation: received_donation3)
received_donation_item2 = DonationItem.create(quantity: 1,
supply_item: past_family2.supply_items[3],
donation: received_donation4)
received_donation_item3 = DonationItem.create(quantity: 1,
supply_item: past_family3.supply_items.first,
donation: received_donation1)
received_donation_item4 = DonationItem.create(quantity: 1,
supply_item: past_family3.supply_items.first,
donation: received_donation2)
received_donation_item5 = DonationItem.create(quantity: 1,
supply_item: past_family4.supply_items[2],
donation: received_donation3)
received_donation_item6 = DonationItem.create(quantity: 1,
supply_item: past_family5.supply_items[1],
donation: received_donation4)
received_donation_item7 = DonationItem.create(quantity: 1,
supply_item: past_family6.supply_items.first,
donation: received_donation1)
received_donation_item8 = DonationItem.create(quantity: 1,
supply_item: past_family6.supply_items.last,
donation: received_donation2)
received_donation_item9 = DonationItem.create(quantity: 1,
supply_item: past_family7.supply_items[1],
donation: received_donation3)
received_donation_item10 = DonationItem.create(quantity: 1,
supply_item: past_family7.supply_items.first,
donation: received_donation4)
