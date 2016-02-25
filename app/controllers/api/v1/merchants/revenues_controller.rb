class Api::V1::Merchants::RevenuesController < ApplicationController
  # respond_to :json

  def show
    render  json: Merchant.find_by(id: params[:id]),
            serializer: ::MerchantRevenueSerializer,
            date: params[:date]
  end
end
