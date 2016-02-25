require 'rails_helper'

RSpec.describe Api::V1::Merchants::RevenuesController, type: :controller do

  let!(:merchant)       { create(:merchant) }
  let!(:item1)          { create(:item, merchant: merchant) }
  let!(:item2)          { create(:item, merchant: merchant) }
  let!(:invoice1)       { create(:invoice, merchant: merchant) }
  let!(:invoice2)       { create(:invoice, merchant: merchant, created_at: "2015-03-25 09:54:09") }
  let!(:invoice_item1)  { create(:invoice_item, invoice: invoice1, item: item1) }
  let!(:invoice_item2)  { create(:invoice_item, invoice: invoice1, item: item2) }
  let!(:invoice_item3)  { create(:invoice_item, invoice: invoice2, item: item1) }
  let!(:transaction1)   { create(:transaction, invoice: invoice1)}
  let!(:transaction2)   { create(:transaction, invoice: invoice2)}

  describe "GET #show" do
    it "returns http success" do
      get :show, id: Merchant.first.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns the correct revenue when not given a date" do
      get :show, format: :json, id: Merchant.first.id
      assert_equal "359.64", json_response["revenue"]
    end

    it "returns the correct revenue when given a date" do
      get :show, format: :json, id: Merchant.first.id, date: "2015-03-25 09:54:09"
      assert_equal "119.88", json_response["revenue"]
    end
  end

end
