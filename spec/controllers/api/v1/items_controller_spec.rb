require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      customer = create(:item)
      get :show, id: Item.first.id, format: :json
      expect(response).to have_http_status(:success)
    end
  end

end
