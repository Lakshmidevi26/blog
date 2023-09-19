FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    topic_id { 5 }
  end
end
