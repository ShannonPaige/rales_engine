class Api::V1::Customers::FavoriteMerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.find_by(id: params[:id]).favorite_merchant
  end
end
