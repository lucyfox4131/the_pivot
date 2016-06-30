FactoryGirl.define do
  factory :category do
    name
    slug
  end

  sequence :name do |n|
   "Category#{n}"
  end

  sequence :slug do |n|
    "slug-#{n}"
  end

  factory :user do
    username "user"
    password  "password"
    email "email@example.com"
    cell "7345678778"
    role 0
  end

  factory :other_user, class: User do
    username "other"
    password  "password"
    email "other@example.com"
    role 0
  end

  factory :admin, class: User do
    username "admin"
    password  "password"
    email "email@example.com"
    role 1
  end

  factory :nationality do
    photo_path "x"
    info_link "x"
    greeting "x"
    name "Somali"
  end

  factory :charity do
    name {generate(:charity_name)}
    description {generate(:charity_description)}
    status 2
  end

  sequence :charity_name do |n|
    "charity_#{n}"
  end

  sequence :charity_description do |n|
    "This is the charity description for our charity_#{n}"
  end

  sequence :last_name do |n|
    "last_name#{n}"
  end

  factory :family do
    first_name "x"
    last_name
    arrival_date { 10.days.from_now }
    donation_deadline { 5.days.from_now }
    nationality
    num_married_adults 2
    num_unmarried_adults 0
    num_children_over_two 1
    num_children_under_two 0
    charity
  end

  factory :supply do
    name "Twin Bedframe"
    value  30.0
    description "Sample."
    multiplier_type "child"
  end

  factory :supply_item do
    family_id 1
    supply_id 1
    quantity 3
  end

  factory :donation do
    status "Pledged"
    user
  end

  factory :donation_item do
    quantity 1
    supply_item_id 1
    donation_id 1
  end

  factory :loan do
    requested_amount 1000
    description "This loan is to start a bakery in the US"
    family_id 1
  end

  factory :loan_item do
    loan_id 1
    donation_id 1
    amount 100
  end

end
