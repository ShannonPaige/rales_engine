class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  default_scope -> { order('id ASC') }

  def revenue_by_merchant(date)
    if date
      self.invoices.successful.joins(:invoice_items).where(created_at: date).sum("quantity * unit_price")
    else
      self.invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
    end
  end

  def self.total_revenue_merchants(date)
    Invoice.belongs_to_merchant.successful.joins(:invoice_items).where(created_at: date).sum("quantity * unit_price")
  end

  def pending_customers
    need_to_pay = []
    self.invoices.pending.map do |invoice|
      need_to_pay << invoice.customer
    end
    need_to_pay.uniq
  end

  def favorite_customer
    Customer.find(self.invoices.successful.unscope(:order).group(:customer_id).count.to_h
    .max_by { |customer, quantity| quantity }.first)
  end

end
