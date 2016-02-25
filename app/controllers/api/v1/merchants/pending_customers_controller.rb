class Api::V1::Merchants::PendingCustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.find_by(id: params[:id]).pending_customers
  end
end
