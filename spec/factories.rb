FactoryGirl.define do
  factory :transaction do
    invoice
    credit_card_number "4141"
    result "success"
  end
  factory :invoice_item do
    item
    invoice
    quantity "12"
    unit_price "9.99"
  end
  factory :item do
    name "Laptop"
    description "Run rails on here"
    unit_price "9.99"
    merchant
  end
  factory :invoice do
    customer
    merchant
    status "success"
  end
  factory :merchant do
    name "Mac"
  end
  factory :customer do
    first_name "Shannon"
    last_name "Paige"
  end
end
