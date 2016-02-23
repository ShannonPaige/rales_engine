require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do

  let!(:transaction1) { create(:transaction) }
  let!(:transaction2) { create(:transaction) }

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
      assert_equal Transaction.count, json_response.count
    end

    it "returns the correct objects" do
      get :index, format: :json
      object1 = json_response.first
      object2 = json_response.last

      assert_equal transaction1.id, object1["id"]
      assert_equal transaction1.invoice_id, object1["invoice_id"]
      assert_equal transaction2.id, object2["id"]
      assert_equal transaction2.invoice_id, object2["invoice_id"]
    end

    it "finds all the correct objects when given the id as a parameter" do
      get :index, format: :json, id: Transaction.first.id
      object1 = json_response.first
      assert_equal transaction1.id, object1["id"]
    end

    it "finds all the correct objects when given the invoice_id as a parameter" do
      get :index, format: :json, invoice_id: Transaction.first.invoice_id
      object1 = json_response.first
      assert_equal transaction1.id, object1["id"]
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: Transaction.first.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns one object" do
      get :show, format: :json, id: Transaction.first.id
      assert_kind_of Hash, json_response
    end

    it "returns the correct object" do
      get :show, format: :json, id: Transaction.first.id
      assert_equal transaction1.id, json_response["id"]
    end

    it "finds the correct object when given the id as a parameter" do
      get :show, format: :json, id: Transaction.first.id
      assert_equal transaction1.id, json_response["id"]
    end

    it "finds the correct object when given the invoice_id as a parameter" do
      get :show, format: :json, invoice_id: Transaction.first.invoice_id
      assert_equal transaction1.id, json_response.first["id"]
    end

    it "can return a random object" do
      get :show, format: :json
      assert_kind_of Array, json_response
      assert_equal 1, json_response.count
      assert_equal "success", json_response.first["result"]
    end
  end

end
