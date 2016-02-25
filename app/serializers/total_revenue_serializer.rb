class TotalRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    Merchant.total_revenue_merchants(instance_options[:date])
  end
end
