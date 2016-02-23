require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do

  let!(:merchant1) { create(:merchant) }
  let!(:merchant2) { create(:merchant) }

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
      assert_equal Merchant.count, json_response.count
    end

    it "returns the correct objects" do
      get :index, format: :json
      object1 = json_response.first
      object2 = json_response.last

      assert_equal merchant1.id, object1["id"]
      assert_equal merchant1.name, object1["name"]
      assert_equal merchant2.id, object2["id"]
      assert_equal merchant2.name, object2["name"]
    end

    it "finds all the correct objects when given the id as a parameter" do
      get :index, format: :json, id: Merchant.first.id
      object1 = json_response.first
      assert_equal merchant1.id, object1["id"]
    end

    it "finds all the correct objects when given the name as a parameter" do
      get :index, format: :json, name: Merchant.first.name
      object1 = json_response.first
      assert_equal merchant1.id, object1["id"]
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: Merchant.first.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns one object" do
      get :show, format: :json, id: Merchant.first.id
      assert_kind_of Hash, json_response
    end

    it "returns the correct object" do
      get :show, format: :json, id: Merchant.first.id
      assert_equal merchant1.id, json_response["id"]
    end

    it "finds the correct object when given the id as a parameter" do
      get :show, format: :json, id: Merchant.first.id
      assert_equal merchant1.id, json_response["id"]
    end

    it "finds the correct object when given the name as a parameter" do
      get :show, format: :json, name: Merchant.first.name
      assert_equal merchant1.id, json_response["id"]
    end

    it "can return a random object" do
      get :show, format: :json
      assert_kind_of Array, json_response
      assert_equal 1, json_response.count
      assert_equal "Mac", json_response.first["name"]
    end
  end

end
