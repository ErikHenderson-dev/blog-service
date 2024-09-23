# fronze_string_literal: true

class Category < ApplicationRecord
  has_many :article

  validates :name, presence: true
end
