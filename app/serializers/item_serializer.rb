class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def unit_price
    sprintf( "%0.02f", object.unit_price)
  end
end
