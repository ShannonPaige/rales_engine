class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  default_scope -> { order('id ASC') }

  def favorite_merchant
    Merchant.find(self.invoices.successful.unscope(:order).group(:merchant_id).count.to_h
    .max_by { |merchant, quantity| quantity }.first)
  end
end
