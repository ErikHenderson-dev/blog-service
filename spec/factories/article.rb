# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    id { Faker::Number.digit }
    category_id { Faker::Number.digit }
    title { Faker::Lorem.sentence }
    sub_title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    author { Faker::Name.name }

    association :category
  end
end
