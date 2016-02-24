require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do

  let!(:item)     { create(:item) }
  let!(:invoice_item) { create(:invoice_item, item: item) }

  describe "GET #show" do
    it "returns http success" do
      get :show, format: :json, id: InvoiceItem.first.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct object" do
      get :show, format: :json, id: InvoiceItem.first.id
      assert_kind_of Hash, json_response
      assert_equal invoice_item.item.id, json_response["id"]
    end
  end

end
