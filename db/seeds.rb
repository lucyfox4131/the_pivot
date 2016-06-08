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

nationality1 = Nationality.create(photo_path: "http://www.criticalthreats.org/sites/default/files/AEI_Somalia_Map_Political.gif" ,info_link: "Somali", greeting: "most-critical")
nationality2 = Nationality.create(photo_path: "http://www.edmaps.com/Syrian_Civil_War_Territorial_Control_Map_November_28.png" ,info_link: "Syrian", greeting: "elderly")
nationality3 = Nationality.create(photo_path: "https://www.google.com/search?q=iraq+map+control&espv=2&biw=636&bih=601&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiQvPCc3pjNAhUOb1IKHZvrBK8Q_AUIBigB#imgrc=WUdateDORNem6M%3A" ,info_link: "Iraqi", greeting: "children")
nationality4 = Nationality.create(photo_path: "http://asia.nikkei.com/var/site_cache/storage/images/node_43/node_51/2015/201501/20150128/20150128-myanmar-map/2281975-1-eng-GB/20150128-Myanmar-map_article_main_image.png" ,info_link: "Burmese", greeting: "single-mother")
nationality5 = Nationality.create(photo_path: "http://www.bizbilla.com/country-maps/maps/bhutan-admin.jpg" ,info_link: "Bhutanese", greeting: "east-asia")

family1 = Family.create(first_name: "First1", last_name: "Last1", num_married_adults: 4, num_unmarried_adults: 4, num_children_over_two: 4, num_children_under_two: 4, donation_deadline: Date.today, arrival_date: Date.today)
family2 = Family.create(first_name: "First2", last_name: "Last2", num_married_adults: 2, num_unmarried_adults: 2, num_children_over_two: 2, num_children_under_two: 2, donation_deadline: Date.today, arrival_date: Date.today)
family3 = Family.create(first_name: "First3", last_name: "Last3", num_married_adults: 3, num_unmarried_adults: 3, num_children_over_two: 3, num_children_under_two: 3, donation_deadline: Date.today, arrival_date: Date.today)
family4 = Family.create(first_name: "First4", last_name: "Last4", num_married_adults: 5, num_unmarried_adults: 5, num_children_over_two: 5, num_children_under_two: 5, donation_deadline: Date.today, arrival_date: Date.today)
family5 = Family.create(first_name: "First5", last_name: "Last5", num_married_adults: 2, num_unmarried_adults: 2, num_children_over_two: 2, num_children_under_two: 2, donation_deadline: Date.today, arrival_date: Date.today)

family1.categories << [category1, category2]
family2.categories << [category3]
family3.categories << [category4]
family4.categories << [category5]
family5.categories << [category2, category6]
