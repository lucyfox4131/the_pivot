require 'rails_helper'

RSpec.feature "Guest user visits multiple charities" do
  scenario "multiple loans can be added to a user cart" do
    family_1, family_2 = create(:family, 2)

    visit
  end

end
# As a user I can visit a family from one charity and add their loans/supplies to my cart
# As a user with those loans in my cart I can view another charity and add loans for a family of theirs.
# I can also add supplies for that family.
# When I view my cart I am able to see all these options within it.
# As a guest user I do not see an option to checkout, I see an option to log in or create an account.
