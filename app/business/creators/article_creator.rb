# fronze_string_literal: true

module Creators
  class ArticleCreator < BaseCreator
    def execute
      article_create
    end

    private

    def article_create
      Article.create(
        id: params[:id],
        category_id: params[:category_id],
        title: params[:title],
        sub_title: params[:sub_title],
        publication_date: params[:publication_date],
        text: params[:text],
        author: params[:author]
      )
    end
  end
end
