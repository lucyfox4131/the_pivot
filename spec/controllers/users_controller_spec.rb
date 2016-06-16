require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "assigns a empty user as @user and renders the new template" do
      get(:new)
      expect(assigns(:user)).to be_a_new(User)
      expect(response).to render_template("new")
     end
  end
end
