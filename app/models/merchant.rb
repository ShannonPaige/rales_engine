class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  default_scope -> { order('id ASC') }

  def total_revenue(date)
    if date
      self.invoices.successful.joins(:invoice_items).where(created_at: date).sum("quantity * unit_price")
    else
      self.invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
    end
  end

end
