# fronze_string_literal: true

class Category < ApplicationRecord
  validates :id, :category, presence: true

  validates :id,
            numericality: { only_integer: true }
end
