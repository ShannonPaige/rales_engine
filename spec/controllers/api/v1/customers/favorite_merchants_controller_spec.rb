require 'rails_helper'

RSpec.describe Api::V1::Customers::FavoriteMerchantsController, type: :controller do

  let!(:merchant1)      { create(:merchant) }
  let!(:merchant2)      { create(:merchant) }
  let!(:customer)      { create(:customer) }
  let!(:invoice1)       { create(:invoice, merchant: merchant1, customer: customer) }
  let!(:invoice2)       { create(:invoice, merchant: merchant2, customer: customer) }
  let!(:invoice3)       { create(:invoice, merchant: merchant2, customer: customer) }
  let!(:transaction1)   { create(:transaction, invoice: invoice1) }
  let!(:transaction2)   { create(:transaction, invoice: invoice2) }
  let!(:transaction3)   { create(:transaction, invoice: invoice3) }

  describe "GET #show" do
    it "returns http success" do
      get :show, id: Customer.first.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns the correct customer" do
      get :show, format: :json, id: Customer.first.id
      assert_equal merchant2.id, json_response["id"]
    end
  end

end
