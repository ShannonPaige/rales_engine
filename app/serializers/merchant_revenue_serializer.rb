class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    object.total_revenue(instance_options[:date])
  end
end
