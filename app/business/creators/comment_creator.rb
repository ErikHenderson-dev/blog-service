# fronze_string_literal: true

module Creators
  class CommentCreator < BaseCreator
    def execute
      comment_create
    end

    private

    def comment_create
      Comment.create(
        id: params[:id],
        article_id: params[:article_id],
        comment: params[:comment]
      )
    end
  end
end
