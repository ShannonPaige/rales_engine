require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do

    let!(:invoice_item1) { create(:invoice_item) }
    let!(:invoice_item2) { create(:invoice_item) }

    describe "GET #index" do
      it "returns http success" do
        get :index, format: :json
        expect(response).to have_http_status(:success)
      end

      it "returns an array of objects" do
        get :index, format: :json
        assert_kind_of Array, json_response
      end

      it "returns the correct number of objects" do
        get :index, format: :json
        assert_equal InvoiceItem.count, json_response.count
      end

      it "returns the correct objects" do
        get :index, format: :json
        object1 = json_response.first
        object2 = json_response.last

        assert_equal invoice_item1.id, object1["id"]
        assert_equal invoice_item1.item_id, object1["item_id"]
        assert_equal invoice_item1.invoice_id, object1["invoice_id"]
        assert_equal invoice_item1.quantity, object1["quantity"]
        assert_equal invoice_item1.quantity, object1["quantity"]
        assert_equal invoice_item2.id, object2["id"]
      end

      it "finds all the correct objects when given the id as a parameter" do
        get :index, format: :json, id: InvoiceItem.first.id
        object1 = json_response.first
        assert_equal invoice_item1.id, object1["id"]
      end

      it "finds all the correct objects when given the item_id as a parameter" do
        get :index, format: :json, item_id: InvoiceItem.first.item_id
        object1 = json_response.first
        assert_equal invoice_item1.id, object1["id"]
      end

      it "finds all the correct objects when given the invoice_id as a parameter" do
        get :index, format: :json, invoice_id: InvoiceItem.first.invoice_id
        object1 = json_response.first
        assert_equal invoice_item1.id, object1["id"]
      end

      it "finds all the correct objects when given the quantity as a parameter" do
        get :index, format: :json, quantity: InvoiceItem.first.quantity
        object1 = json_response.first
        assert_equal invoice_item1.id, object1["id"]
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, id: InvoiceItem.first.id, format: :json
        expect(response).to have_http_status(:success)
      end

      it "returns one object" do
        get :show, format: :json, id: InvoiceItem.first.id
        assert_kind_of Hash, json_response
      end

      it "returns the correct object" do
        get :show, format: :json, id: InvoiceItem.first.id
        assert_equal invoice_item1.id, json_response["id"]
      end

      it "finds the correct object when given the id as a parameter" do
        get :show, format: :json, id: InvoiceItem.first.id
        assert_equal invoice_item1.id, json_response["id"]
      end

      it "can return a random object" do
        get :show, format: :json
        assert_kind_of Array, json_response
        assert_equal 1, json_response.count
        assert_equal "12", json_response.first["quantity"]
      end
    end

end
