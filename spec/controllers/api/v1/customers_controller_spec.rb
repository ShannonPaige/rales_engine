require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns an array" do
      get :index, format: :json
      assert_kind_of Array, json_response
    end

    it "returns the correct number of items" do
      customer = create(:customer)
      customer2 = create(:customer)
      get :index, format: :json
      assert_equal Customer.count, json_response.count
    end

    it "returns the correct items" do
      customer1 = create(:customer)
      customer2 = create(:customer)
      get :index, format: :json
      item1 = json_response.first
      item2 = json_response.last

      assert_equal customer1.id, item1["id"]
      assert_equal customer1.first_name, item1["first_name"]
      assert_equal customer1.last_name, item1["last_name"]
      assert_equal customer2.id, item2["id"]
      assert_equal customer2.first_name, item2["first_name"]
      assert_equal customer2.last_name, item2["last_name"]
    end
  end

  describe "GET #show" do
    it "returns http success" do
      customer = create(:customer)
      get :show, id: Customer.first.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns one record" do
      customer = create(:customer)
      customer2 = create(:customer)
      get :show, format: :json, id: Customer.first.id
      assert_kind_of Hash, json_response
    end

    it "returns the correct item" do
      customer = create(:customer)
      customer2 = create(:customer)
      get :show, format: :json, id: Customer.first.id
      assert_equal Customer.first.id, json_response["id"]
    end
  end

end
