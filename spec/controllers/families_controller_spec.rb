require 'rails_helper'

RSpec.describe FamiliesController, type: :controller do
  describe "GET #index" do
    it "assigns all active families as @families and renders the index template" do
    nationality1 = Nationality.create(photo_path: "x",
      info_link: "x",
      greeting: "x",
      name: "Somali")
    family1 = Family.create(first_name: "Abshir",
      last_name: "Dalmar",
      arrival_date: 10.days.from_now,
      donation_deadline: 5.days.from_now,
      nationality_id: nationality1.id,
      num_married_adults: 2,
      num_unmarried_adults: 1,
      num_children_over_two: 1,
      num_children_under_two: 0,
      description: "x")

      get(:index)

      expect(assigns(:families)).to eq([family1])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested family as @family and renders the show template" do
      nationality1 = Nationality.create(photo_path: "x",
        info_link: "x",
        greeting: "x",
        name: "Somali")
      family1 = Family.create(first_name: "Abshir",
        last_name: "Dalmar",
        arrival_date: 10.days.from_now,
        donation_deadline: 5.days.from_now,
        nationality_id: nationality1.id,
        num_married_adults: 2,
        num_unmarried_adults: 1,
        num_children_over_two: 1,
        num_children_under_two: 0)
      get(:show, {:id => family1.to_param})
      expect(assigns(:family)).to eq(family1)
      expect(response).to render_template("show")
    end
  end

end
