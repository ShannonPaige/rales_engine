class Merchant < ActiveRecord::Base
  has_many :items

  default_scope -> { order('id ASC') }
end
