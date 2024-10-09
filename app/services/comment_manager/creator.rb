# fronze_string_literal: true

module CommentManager
  class Creator < ::Base
    def execute
      create_comment
    rescue  ActiveRecord::RecordInvalid => e
      Rails.logger.error("Failed to create comment: #{e.message}")

      { success: false, error: e.message }
    rescue StandardError => e
      Rails.logger.error("Unexpected error occurred: #{e.message}")

      { success: false, error: e.message }
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
