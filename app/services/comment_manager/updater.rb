# frozen_string_literal: true

module CommentManager
  class Updater < ::Base
    def execute
      update_comment
    rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid => e
      handle_error('Failed to update comment', e)
    rescue StandardError => e
      handle_error('Unexpected error occurred', e)
    end

    private

    def comment
      Comment.find(params[:id])
    end

    def update_comment
      comment.update!(params)

      comment
    end
  end
end
