require 'rails_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do

  let!(:merchant) { create(:merchant) }
  let!(:invoice1) { create(:invoice, merchant: merchant) }
  let!(:invoice2) { create(:invoice, merchant: merchant) }

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json, id: Merchant.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct objects" do
      get :index, format: :json, id: Merchant.first.id
      assert_equal merchant.invoices.count, json_response.count
      assert_equal merchant.invoices.first.id, json_response.first["id"]
    end
  end

end
