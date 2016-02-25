require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do

  let!(:invoice1) { create(:invoice) }
  let!(:invoice2) { create(:invoice) }

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
      assert_equal Invoice.count, json_response.count
    end

    it "returns the correct objects" do
      get :index, format: :json
      object1 = json_response.first
      object2 = json_response.last

      assert_equal invoice1.id, object1["id"]
      assert_equal invoice1.customer_id, object1["customer_id"]
      assert_equal invoice1.merchant_id, object1["merchant_id"]
      assert_equal invoice1.status, object1["status"]
      assert_equal invoice2.id, object2["id"]
    end

    it "finds all the correct objects when given the id as a parameter" do
      get :index, format: :json, id: Invoice.first.id
      object1 = json_response.first
      assert_equal invoice1.id, object1["id"]
    end

    it "finds all the correct objects when given the customer_id as a parameter" do
      get :index, format: :json, customer_id: Invoice.first.customer_id
      object1 = json_response.first
      assert_equal invoice1.id, object1["id"]
    end

    it "finds all the correct objects when given the merchant_id as a parameter" do
      get :index, format: :json, merchant_id: Invoice.first.merchant_id
      object1 = json_response.first
      assert_equal invoice1.id, object1["id"]
    end

    it "finds all the correct objects when given the status as a parameter" do
      get :index, format: :json, status: Invoice.first.status
      object1 = json_response.first
      assert_equal invoice1.id, object1["id"]
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: Invoice.first.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns one object" do
      get :show, format: :json, id: Invoice.first.id
      assert_kind_of Hash, json_response
    end

    it "returns the correct object" do
      get :show, format: :json, id: Invoice.first.id
      assert_equal invoice1.id, json_response["id"]
    end

    it "finds the correct object when given the id as a parameter" do
      get :show, format: :json, id: Invoice.first.id
      assert_equal invoice1.id, json_response["id"]
    end

    it "finds the correct object when given the customer_id as a parameter" do
      get :show, format: :json, customer_id: Invoice.first.customer_id
      assert_equal invoice1.id, json_response["id"]
    end

    it "finds the correct object when given the merchant_id as a parameter" do
      get :show, format: :json, merchant_id: Invoice.first.merchant_id
      assert_equal invoice1.id, json_response["id"]
    end

    it "finds the correct object when given the status as a parameter" do
      get :show, format: :json, status: Invoice.first.status
      assert_equal invoice1.id, json_response["id"]
    end

    it "can return a random object" do
      get :show, format: :json
      assert_kind_of Array, json_response
      assert_equal 1, json_response.count
      assert_equal "success", json_response.first["status"]
    end
  end

end
