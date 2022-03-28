# fronze_string_literal: true

class Comment < ApplicationRecord
  self.table_name = 'comments'
  self.primary_key = 'id'
end