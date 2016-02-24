require 'rails_helper'

RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do

  let!(:invoice)     { create(:invoice) }
  let!(:transaction) { create(:transaction, invoice: invoice) }

  describe "GET #show" do
    it "returns http success" do
      get :show, format: :json, id: Transaction.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct object" do
      get :show, format: :json, id: Transaction.first.id
      assert_kind_of Hash, json_response
      assert_equal transaction.invoice.id, json_response["id"]
    end
  end

end
