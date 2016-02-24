require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do

  let!(:merchant) { create(:merchant) }
  let!(:invoice) { create(:invoice, merchant: merchant) }

  describe "GET #show" do
    it "returns http success" do
      get :show, format: :json, id: Invoice.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct object" do
      get :show, format: :json, id: Invoice.first.id
      assert_kind_of Hash, json_response
      assert_equal invoice.merchant.id, json_response["id"]
    end
  end

end
