class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    object.revenue_by_merchant(instance_options[:date])
  end
end
