require 'rails_helper'

RSpec.describe Api::V1::Items::MerchantsController, type: :controller do

  let!(:merchant) { create(:merchant) }
  let!(:item) { create(:item, merchant: merchant) }

  describe "GET #show" do
    it "returns http success" do
      get :show, format: :json, id: Item.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct object" do
      get :show, format: :json, id: Item.first.id
      assert_kind_of Hash, json_response
      assert_equal item.merchant.id, json_response["id"]
    end
  end

end
