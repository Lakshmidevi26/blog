FactoryBot.define do
  factory :user_comment_rating do
    user { nil }
    comment { nil }
    rating { 1 }
  end
end
