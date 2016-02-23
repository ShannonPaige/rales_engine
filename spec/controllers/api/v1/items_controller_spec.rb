require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  let!(:item1) { create(:item) }
  let!(:item2) { create(:item) }

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
      assert_equal Item.count, json_response.count
    end

    it "returns the correct objects" do
      get :index, format: :json
      object1 = json_response.first
      object2 = json_response.last

      assert_equal item1.id, object1["id"]
      assert_equal item1.name, object1["name"]
      assert_equal item1.description, object1["description"]
      assert_equal item1.unit_price, object1["unit_price"]
      assert_equal item1.merchant_id, object1["merchant_id"]
      assert_equal item2.id, object2["id"]
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: Item.first.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns one object" do
      get :show, format: :json, id: Item.first.id
      assert_kind_of Hash, json_response
    end

    it "returns the correct object" do
      get :show, format: :json, id: Item.first.id
      assert_equal item1.id, json_response["id"]
    end

    it "finds the correct object when given the id as a parameter" do
      get :show, format: :json, id: Item.first.id
      assert_equal item1.id, json_response["id"]
    end

    it "finds the correct object when given the name as a parameter" do
      get :show, format: :json, name: Item.first.name
      assert_equal item1.id, json_response["id"]
    end

    it "can return a random object" do
      get :show, format: :json
      assert_kind_of Array, json_response
      assert_equal 1, json_response.count
      assert_equal "Laptop", json_response.first["name"]
    end
  end

end
