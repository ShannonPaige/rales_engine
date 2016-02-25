class Api::V1::Merchants::TotalRevenuesController < ApplicationController
  def show
    render  json: Merchant.all,
            serializer: ::TotalRevenueSerializer,
            date: params[:date]
  end
end
