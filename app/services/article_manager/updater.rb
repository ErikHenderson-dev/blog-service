# fronze_string_literal: true

module ArticleManager
  class Updater < ::Base
    def execute
      update_article
    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.error("Failed to update article: #{e.message}")

      { success: false, error: e.message }
    rescue  ActiveRecord::RecordInvalid => e
      Rails.logger.error("Failed to update article: #{e.message}")

      { success: false, error: e.message }
    rescue StandardError => e
      Rails.logger.error("Unexpected error occurred: #{e.message}")

      { success: false, error: e.message }
    end

    private
    
    def article
      Article.find(params[:id])
    end

    def update_article
      article.update!(params)

      article
    end
  end
end
