require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns the correct number of items" do
      customer = create(:customer)
      customer2 = create(:customer)
      get :index, format: :json
      assert_equal Customer.count, json_response.count
    end

    it "returns the correct properties" do
      customer = create(:customer)
      get :index, format: :json
      json_response.each do |item|
        assert item["first_name"]
        assert item["last_name"]
      end
    end
  end

  describe "GET #show" do
    it "returns http success" do
      customer = create(:customer)
      get :show, id: Customer.first.id, format: :json
      expect(response).to have_http_status(:success)
    end
  end

end
