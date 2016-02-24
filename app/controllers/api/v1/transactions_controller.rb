class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.where(trasaction_params)
  end

  def show
    if trasaction_params == {}
      respond_with Transaction.limit(1).order("RANDOM()")
    else
      respond_with Transaction.find_by(trasaction_params)
    end
  end

  private

    def trasaction_params
      params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
    end
end
