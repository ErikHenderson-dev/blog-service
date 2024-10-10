# frozen_string_literal: true

module CommentManager
  class Creator < ::Base
    def execute
      create_comment
    rescue ActiveRecord::RecordInvalid => e
      handle_error('Failed to create comment', e)
    rescue StandardError => e
      handle_error('Unexpected error occurred', e)
    end

    private

    def create_comment
      Comment.create!(
        article_id: params[:article_id],
        text: params[:text]
      )
    end
  end
end
