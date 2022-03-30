FactoryBot.define do
  factory :comment do
    id { 1 }
    article_id { 1 }
    comment { 'teste' }
  end
end
