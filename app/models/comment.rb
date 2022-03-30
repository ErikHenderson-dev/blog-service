# fronze_string_literal: true

class Comment < ApplicationRecord
  validates :id, :comment, presence: true

  validates :id,
            numericality: { only_integer: true }
end
