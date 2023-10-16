FactoryBot.define do
  factory :space do
    event
    status { 'available' }
    sequence(:position) { |n| n }
  end
end
