FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number "MyString"
    result "MyString"
  end
  factory :invoice_item do
    item nil
    invoice nil
    quantity "MyString"
    unit_price "9.99"
  end
  factory :item do
    name "MyString"
    description "MyString"
    unit_price "9.99"
    merchant nil
  end
  factory :invoice do
    customer nil
    merchant nil
  end
  factory :merchant do
    name "MyString"
  end
  factory :customer do
    first_name "MyString"
    last_name "MyString"
  end
end
