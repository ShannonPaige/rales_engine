class Api::V1::Merchants::RevenuesController < ApplicationController
  def show
    render  json: Merchant.find_by(id: params[:id]),
            serializer: ::MerchantRevenueSerializer,
            date: params[:date]
  end
end
