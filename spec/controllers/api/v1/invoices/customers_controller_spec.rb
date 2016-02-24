require 'rails_helper'

RSpec.describe Api::V1::Invoices::CustomersController, type: :controller do

  let!(:customer) { create(:customer) }
  let!(:invoice) { create(:invoice, customer: customer) }

  describe "GET #show" do
    it "returns http success" do
      get :show, format: :json, id: Invoice.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct object" do
      get :show, format: :json, id: Invoice.first.id
      assert_kind_of Hash, json_response
      assert_equal invoice.customer.id, json_response["id"]
    end
  end

end
