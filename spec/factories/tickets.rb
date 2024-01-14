FactoryBot.define do
  factory :ticket do
    buyer_name { 'Example Event' }
    quantity { 5 }
    total_price { 80 }
    event_id { 2 }
  end
end
