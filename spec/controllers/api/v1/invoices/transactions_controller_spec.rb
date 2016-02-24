require 'rails_helper'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do

  let!(:invoice) { create(:invoice) }
  let!(:transaction1) { create(:transaction, invoice: invoice) }
  let!(:transaction2) { create(:transaction, invoice: invoice) }

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json, id: Invoice.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct objects" do
      get :index, format: :json, id: Invoice.first.id
      assert_equal invoice.transactions.count, json_response.count
      assert_equal invoice.transactions.first.id, json_response.first["id"]
    end
  end

end
