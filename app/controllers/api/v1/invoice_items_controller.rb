class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.where(invoice_item_params)
  end

  def show
    if invoice_item_params == {}
      respond_with InvoiceItem.limit(1).order("RANDOM()")
    else
      respond_with InvoiceItem.find_by(invoice_item_params)
    end
  end

  private

    def invoice_item_params
      params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
    end
end
