FactoryBot.define do
  factory :ticket do
    event
    customer
    name { "aiden" }
    sequence(:seat) { |n| n }
  end
end
