require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  let!(:customer1) { create(:customer) }
  let!(:customer2) { create(:customer) }

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
      assert_equal Customer.count, json_response.count
    end

    it "returns the correct objects" do
      get :index, format: :json
      object1 = json_response.first
      object2 = json_response.last

      assert_equal customer1.id, object1["id"]
      assert_equal customer1.first_name, object1["first_name"]
      assert_equal customer1.last_name, object1["last_name"]
      assert_equal customer2.id, object2["id"]
      assert_equal customer2.first_name, object2["first_name"]
      assert_equal customer2.last_name, object2["last_name"]
    end

    it "finds all the correct objects when given the id as a parameter" do
      get :index, format: :json, id: Customer.first.id
      object1 = json_response.first
      assert_equal customer1.id, object1["id"]
    end

    it "finds all the correct objects when given the first_name as a parameter" do
      get :index, format: :json, first_name: Customer.first.first_name
      object1 = json_response.first
      assert_equal customer1.id, object1["id"]
    end

    it "finds all the correct objects when given the last_name as a parameter" do
      get :index, format: :json, last_name: Customer.first.last_name
      object1 = json_response.first
      assert_equal customer1.id, object1["id"]
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: Customer.first.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns one object" do
      get :show, format: :json, id: Customer.first.id
      assert_kind_of Hash, json_response
    end

    it "returns the correct object" do
      get :show, format: :json, id: Customer.first.id
      assert_equal customer1.id, json_response["id"]
    end

    it "finds the correct object when given the id as a parameter" do
      get :show, format: :json, id: Customer.first.id
      assert_equal customer1.id, json_response["id"]
    end

    it "finds the correct object when given the first name as a parameter" do
      get :show, format: :json, first_name: Customer.first.first_name
      assert_equal customer1.id, json_response["id"]
    end

    it "finds the correct object when given the last name as a parameter" do
      get :show, format: :json, last_name: Customer.first.last_name
      assert_equal customer1.id, json_response["id"]
    end

    it "can return a random object" do
      get :show, format: :json
      assert_kind_of Array, json_response
      assert_equal 1, json_response.count
      assert_equal "Shannon", json_response.first["first_name"]
      assert_equal "Paige", json_response.first["last_name"]
    end
  end

end
