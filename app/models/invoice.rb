class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant

  default_scope -> { order('id ASC') }

end
