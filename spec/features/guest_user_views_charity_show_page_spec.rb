require 'rails_helper'

RSpec.feature "Guest Views Charity" do
  context "guest views an existing charity" do
    scenario "guest sees all families and details of that charity" do
      family = create(:family)
      charity = family.charity
      visit charity_path(charity.slug)

      expect(page).to have_content(charity.name)
      expect(page).to have_content(charity.description)
      expect(page).to have_link("#{family.nationality.name} Family of #{family.num_people}")
      expect(page).to have_content "Donations Recieved"
      expect(page).to have_content "Money Raised"
      expect(page).to have_content "Families Helped"

      click_link "#{family.nationality.name} Family of #{family.num_people}"
      expect(current_path).to eq(charity_families_path(charity.slug, family.id))
    end
  end
end
