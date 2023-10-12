FactoryBot.define do
  factory :space do
    event
    sequence(:position) { |n| n }
  end
end
