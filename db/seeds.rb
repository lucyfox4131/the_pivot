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

nationality1 = Nationality.create(photo_path: "", info_link: "", greeting: "", name: "Syrian")
nationality2 = Nationality.create(photo_path: "", info_link: "", greeting: "", name: "Iraqi")
nationality3 = Nationality.create(photo_path: "", info_link: "", greeting: "", name: "Afghan")
nationality4 = Nationality.create(photo_path: "", info_link: "", greeting: "", name: "Burmese")
nationality5 = Nationality.create(photo_path: "", info_link: "", greeting: "", name: "Bhutanese")

family1 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality1.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)
family2 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality2.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 2, num_children_under_two: 1)
family3 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality3.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)
family4 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality4.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)
family5 = Family.create(first_name: "TestFirst", last_name: "TestLast", arrival_date: 10.days.from_now, donation_deadline: 5.days.from_now, nationality_id: nationality5.id, num_married_adults: 2, num_unmarried_adults: 1, num_children_over_two: 0, num_children_under_two: 0)


family1.categories << [category1, category2]
family2.categories << [category3]
family3.categories << [category4]
family4.categories << [category5]
family5.categories << [category2, category6]

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
