# frozen_string_literal: true

module ArticleManager
  class Creator < ::Base
    def execute
      create_article
    rescue ActiveRecord::RecordInvalid => e
      handle_error('Failed to create article', e)
    rescue StandardError => e
      handle_error('Unexpected error occurred', e)
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
