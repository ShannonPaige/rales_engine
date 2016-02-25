require 'rails_helper'

RSpec.describe Api::V1::Merchants::TotalRevenuesController, type: :controller do

  let!(:merchant1)      { create(:merchant) }
  let!(:merchant2)      { create(:merchant) }
  let!(:item1)          { create(:item, merchant: merchant1) }
  let!(:item2)          { create(:item, merchant: merchant1) }
  let!(:invoice1)       { create(:invoice, merchant: merchant1, created_at: "2015-03-25 09:54:09") }
  let!(:invoice2)       { create(:invoice, merchant: merchant2, created_at: "2015-03-25 09:54:09") }
  let!(:invoice_item1)  { create(:invoice_item, invoice: invoice1, item: item1) }
  let!(:invoice_item2)  { create(:invoice_item, invoice: invoice2, item: item2) }
  let!(:transaction1)   { create(:transaction, invoice: invoice1)}
  let!(:transaction2)   { create(:transaction, invoice: invoice2)}

  describe "GET #show" do
    it "returns http success" do
      get :show, format: :json, date: "2015-03-25 09:54:09"
      expect(response).to have_http_status(:success)
    end

    it "returns the correct revenue when given a date" do
      get :show, format: :json, date: "2015-03-25 09:54:09"
      assert_equal "239.76", json_response["total_revenue"]
    end
  end

end
