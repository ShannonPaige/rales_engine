require 'rails_helper'

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do

  let!(:merchant) { create(:merchant) }
  let!(:item1) { create(:item, merchant: merchant) }
  let!(:item2) { create(:item, merchant: merchant) }

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json, id: Merchant.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct objects" do
      get :index, format: :json, id: Merchant.first.id
      assert_equal merchant.items.count, json_response.count
      assert_equal merchant.items.first.id, json_response.first["id"]
    end
  end

end
