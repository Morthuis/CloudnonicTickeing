FactoryBot.define do
  factory :event do
    name { 'Example Event' }
    location {'vegas'}
    description { 'A new test event' }
    start_time { '2024-01-14 06:13:48.556' }
    end_time { '2024-01-14 06:13:48.556' }
  end
end
