class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.where(customer_params)
  end

  def show
    if customer_params == {}
      respond_with Customer.limit(1).order("RANDOM()")
    else
      respond_with Customer.find_by(customer_params)
    end
  end

  private

    def customer_params
      params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end
