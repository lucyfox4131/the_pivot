require 'rails_helper'

RSpec.feature "Guest Views Charity" do
  context "guest views an existing charity" do
    scenario "guest sees all families and details of that charity" do
      family_1, family_2, family_3 = create_list(:family, 3)
      charity = family_1.charity
      
      visit charity_path(charity.slug)

      expect(page).to have_content(charity.name)
      expect(page).to have_content(charity.description)
      expect(page).to have_link("#{family_1.nationality.name} Family of #{family_1.num_people}")
      expect(page).to have_content "Donations Received"
      expect(page).to have_content "Money Raised"
      expect(page).to have_content "Families Helped"

      click_link "#{family_1.nationality.name} Family of #{family_1.num_people}"
      expect(current_path).to eq(family_path(family_1.id))
    end
  end
end
