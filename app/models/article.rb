# fronze_string_literal: true

class Article < ApplicationRecord
  belongs_to :category
  has_many :comment

  validates :category_id, :title, :text, :author, presence: true
  validates :category_id, numericality: { only_integer: true }
end
