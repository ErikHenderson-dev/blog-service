# fronze_string_literal: true

module CommentManager
  class Updater < ::Base
    def execute
      update_comment
    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.error("Failed to update comment: #{e.message}")

      { success: false, error: e.message }
    rescue  ActiveRecord::RecordInvalid => e
      Rails.logger.error("Failed to update comment: #{e.message}")

      { success: false, error: e.message }
    rescue StandardError => e
      Rails.logger.error("Unexpected error occurred: #{e.message}")

      { success: false, error: e.message }
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
