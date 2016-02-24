require 'rails_helper'

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do

  let!(:customer) { create(:customer) }
  let!(:invoice1) { create(:invoice, customer: customer) }
  let!(:invoice2) { create(:invoice, customer: customer) }

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json, id: Customer.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct objects" do
      get :index, format: :json, id: Customer.first.id
      assert_equal customer.invoices.count, json_response.count
      assert_equal customer.invoices.first.id, json_response.first["id"]
    end
  end

end
