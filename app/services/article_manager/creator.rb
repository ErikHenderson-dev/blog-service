# fronze_string_literal: true

module ArticleManager
  class Creator < ::Base
    def execute
      create_article
    rescue  ActiveRecord::RecordInvalid => e
      Rails.logger.error("Failed to create article: #{e.message}")

      { success: false, error: e.message }
    rescue StandardError => e
      Rails.logger.error("Unexpected error occurred: #{e.message}")

      { success: false, error: e.message }
    end

    private

    def create_article
      Article.create!(
        category_id: params[:category_id],
        title: params[:title],
        sub_title: params[:sub_title],
        text: params[:text],
        author: params[:author]
      )
    end
  end
end