require 'rails_helper'

RSpec.feature "user can view all families" do
  scenario "they see a list of all active families" do
    nationality1 = create(:nationality, name: "Somali")
    nationality2 = create(:nationality, name: "Syrian")
    nationality3 = create(:nationality, name: "Iraqi")
    nationality4 = create(:nationality, name: "Past")

    family1 = create(:family, nationality: nationality1)
    family2 = create(:family, nationality: nationality2)
    family3 = create(:family, nationality: nationality3)
    past_family1 = create(:family, nationality: nationality4,
                                   arrival_date: 10.days.ago,
                                   donation_deadline: 15.days.ago)

    visit families_path

    within(".nationality") do
      expect(page).to have_content "#{family1.nationality.name} Families Arriving"
      expect(page).to have_content "#{family2.nationality.name} Families Arriving"
      expect(page).to have_content "#{family3.nationality.name} Families Arriving"
    end

    within ".#{family1.nationality.name}" do
      expect(page).to have_content("Family of #{family1.num_people}")
    end

    within ".#{family2.nationality.name}"  do
      expect(page).to have_content("Family of #{family2.num_people}")
    end

    within ".#{family3.nationality.name}"  do
      expect(page).to have_content("Family of #{family3.num_people}")
    end

    within ".#{nationality4.name}"  do
      expect(page).to_not have_content("Family")
    end
  end
end
