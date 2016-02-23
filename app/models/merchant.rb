class Merchant < ActiveRecord::Base

  default_scope -> { order('id ASC') }
end
