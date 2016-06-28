FactoryGirl.define do
  factory :user do
    username "user"
    password  "password"
    email "email@example.com"
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
    name "x"
  end

  factory :family do
    first_name "x"
    last_name "x"
    arrival_date { 10.days.from_now }
    donation_deadline { 5.days.from_now }
    nationality_id 1
    num_married_adults 2
    num_unmarried_adults 1
    num_children_over_two 1
    num_children_under_two 0
  end

  factory :supply do
    name "Twin Bedframe"
    value  30.0
    description "Sample."
    multiplier_type "child"
  end

  factory :donation do
    status "Pledged"
    user
  end

end
