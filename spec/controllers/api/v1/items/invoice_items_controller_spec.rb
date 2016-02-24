require 'rails_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :controller do

  let!(:item) { create(:item) }
  let!(:invoice_item1) { create(:invoice_item, item: item) }
  let!(:invoice_item2) { create(:invoice_item, item: item) }

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json, id: Item.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct objects" do
      get :index, format: :json, id: Item.first.id
      assert_equal item.invoice_items.count, json_response.count
      assert_equal item.invoice_items.first.id, json_response.first["id"]
    end
  end

end
