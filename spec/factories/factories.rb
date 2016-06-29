FactoryGirl.define do
  factory :user do
    username "user"
    password  "password"
    email "email@example.com"
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

  factory :family do
    first_name "x"
    last_name "x"
    arrival_date { 10.days.from_now }
    donation_deadline { 5.days.from_now }
    nationality
    num_married_adults 2
    num_unmarried_adults 0
    num_children_over_two 1
    num_children_under_two 0
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

end
