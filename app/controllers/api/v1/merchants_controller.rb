class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.where(merchant_params)
  end

  def show
    if merchant_params == {}
      respond_with Merchant.limit(1).order("RANDOM()")
    else
      respond_with Merchant.find_by(merchant_params)
    end
  end

  private

    def merchant_params
      params.permit(:id, :name, :created_at, :updated_at)
    end
end
