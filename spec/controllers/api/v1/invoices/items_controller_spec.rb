require 'rails_helper'

RSpec.describe Api::V1::Invoices::ItemsController, type: :controller do

  let!(:invoice) { create(:invoice) }
  let!(:item1) { create(:item) }
  let!(:item2) { create(:item) }
  let!(:invoice_item1) { create(:invoice_item, invoice: invoice, item: item1) }
  let!(:invoice_item2) { create(:invoice_item, invoice: invoice, item: item2) }

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json, id: Invoice.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct objects" do
      get :index, format: :json, id: Invoice.first.id
      assert_equal invoice.items.count, json_response.count
      assert_equal invoice.items.first.id, json_response.first["id"]
    end
  end

end
