class Seed

  def initialize
    create_categories
    create_charities
  end

  def create_categories
    #10 categories
    #eventually pull this out into a hash method
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
  end

  def create_charities
    #20 charities
  end

  def create_active_families
    #40 families (per charity)
  end

  def create_past_families
    #10 families (per charity)
  end

  def create_users
    #100 users
  end

  def create_donations
    #10 donations(per user)
    #status either received cancelled or pledged
  end

  def create_charity_admin
    #1 (per charity)
  end

  def create_platform_admin
    #at leat 1
  end

  def create_supply_items
    #copy data from seed file(bc specific) and put it in separate class?(maybe module)
    #within that same class, create association between family and supply items(algorithm)
  end

  def create_donation_items
    #
  end
end
Seed.new
