FactoryBot.define do
  factory :article do
    id { Faker::Number.digit }
    category_id { Faker::Number.digit }
    title { Faker::Lorem.sentence }
    sub_title { Faker::Lorem.sentence }
    publication_date { '2022-03-30' }
    text { Faker::Lorem.paragraph }
    author { Faker::Name.name }
  end
end
