require 'rails_helper'

RSpec.describe "UserAddsSupplyToCarts", type: :request do
  describe "GET /user_adds_supply_to_carts" do
    it "adds supplies to cart successfully" do
      get user_adds_supply_to_carts_path
      expect(response).to have_http_status(200)
    end
  end
end
