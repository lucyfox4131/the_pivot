# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category1 = Category.create(name: "Most Critical")
category2 = Category.create(name: "Elderly")
category3 = Category.create(name: "Children")
category4 = Category.create(name: "Single Mother")
category5 = Category.create(name: "Middle East")
category6 = Category.create(name: "East Asia")
category7 = Category.create(name: "Africa")
category8 = Category.create(name: "Latin America")

family1 = Family.create(first_name: "First1", last_name: "Last1", num_people: 4, nationality: "Somali", arrival_date: Date.today)
family2 = Family.create(first_name: "First2", last_name: "Last2", num_people: 2, nationality: "Syrian", arrival_date: Date.today)
family3 = Family.create(first_name: "First3", last_name: "Last3", num_people: 3, nationality: "Iraqi", arrival_date: Date.today)
family4 = Family.create(first_name: "First4", last_name: "Last4", num_people: 5, nationality: "Burmese", arrival_date: Date.today)
family5 = Family.create(first_name: "First5", last_name: "Last5", num_people: 3, nationality: "Bhutanese", arrival_date: Date.today)

family1.categories << [category1, category2]
family2.categories << [category3]
family3.categories << [category4]
family4.categories << [category5]
family5.categories << [category2, category6]
