class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  default_scope -> { order('id ASC') }

  def self.successful
    joins(:transactions).where(transactions: {result: "success"})
  end

  def self.pending
    joins(:transactions).where(transactions: {result: "failed"})
  end

  def self.belongs_to_merchant
    where.not(merchant_id: nil)
  end

end
