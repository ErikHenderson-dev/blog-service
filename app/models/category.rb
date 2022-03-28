# fronze_string_literal: true

class Category < ApplicationRecord
  self.table_name = 'categories'
  self.primary_key = 'id'
end
