require 'rails_helper'

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :controller do

  let!(:invoice) { create(:invoice) }
  let!(:invoice_item1) { create(:invoice_item, invoice: invoice) }
  let!(:invoice_item2) { create(:invoice_item, invoice: invoice) }

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json, id: Invoice.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct objects" do
      get :index, format: :json, id: Invoice.first.id
      assert_equal invoice.invoice_items.count, json_response.count
      assert_equal invoice.invoice_items.first.id, json_response.first["id"]
    end
  end

end
