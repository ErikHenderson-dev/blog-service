# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    id { 1 }
    article_id { 1 }
    text { 'teste' }
  end
end
