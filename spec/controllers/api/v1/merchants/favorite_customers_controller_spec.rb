require 'rails_helper'

RSpec.describe Api::V1::Merchants::FavoriteCustomersController, type: :controller do

  let!(:merchant)       { create(:merchant) }
  let!(:customer1)      { create(:customer) }
  let!(:customer2)      { create(:customer) }
  let!(:item1)          { create(:item, merchant: merchant) }
  let!(:invoice1)       { create(:invoice, merchant: merchant, customer: customer1) }
  let!(:invoice2)       { create(:invoice, merchant: merchant, customer: customer2) }
  let!(:invoice3)       { create(:invoice, merchant: merchant, customer: customer2) }
  let!(:transaction1)   { create(:transaction, invoice: invoice1) }
  let!(:transaction2)   { create(:transaction, invoice: invoice2) }
  let!(:transaction3)   { create(:transaction, invoice: invoice3) }

  describe "GET #show" do
    it "returns http success" do
      get :show, id: Merchant.first.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns the correct customer" do
      get :show, format: :json, id: Merchant.first.id
      assert_equal customer2.id, json_response["id"]
    end
  end

end
