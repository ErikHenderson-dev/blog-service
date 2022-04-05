# fronze_string_literal: true

module Creators
  class CategoryCreator < BaseCreator
    def execute
      category_create
    end

    private

    def category_create
      Category.create(id: params[:id], category: params[:category])
    end
  end
end
