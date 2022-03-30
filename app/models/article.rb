# fronze_string_literal: true

class Article < ApplicationRecord
  validates :id, :category_id, :title, :sub_title,
            :publication_date, :text, :author,
            presence: true

  validates :id,
            numericality: { only_integer: true }

  validates :category_id,
            numericality: { only_integer: true }
end
