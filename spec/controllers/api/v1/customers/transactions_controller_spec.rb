require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do

  let!(:customer) { create(:customer) }
  let!(:invoice)  { create(:invoice, customer: customer) }
  let!(:transaction1) { create(:transaction, invoice: invoice) }
  let!(:transaction2) { create(:transaction, invoice: invoice) }

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json, id: Customer.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct objects" do
      get :index, format: :json, id: Customer.first.id
      assert_equal customer.transactions.count, json_response.count
      assert_equal customer.transactions.first.id, json_response.first["id"]
    end
  end

end
