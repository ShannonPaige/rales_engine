class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.where(invoice_params)
  end

  def show
    if invoice_params == {}
      respond_with Invoice.limit(1).order("RANDOM()")
    else
      respond_with Invoice.find_by(invoice_params)
    end
  end

  private

    def invoice_params
      params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
    end
end
