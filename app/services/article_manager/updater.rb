# frozen_string_literal: true

module ArticleManager
  class Updater < ::Base
    def execute
      update_article
    rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid => e
      handle_error('Failed to update article', e)
    rescue StandardError => e
      handle_error('Unexpected error occurred', e)
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
