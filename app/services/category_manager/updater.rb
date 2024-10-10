# frozen_string_literal: true

module CategoryManager
  class Updater < ::Base
    def execute
      update_category
    rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid => e
      handle_error('Failed to update category', e)
    rescue StandardError => e
      handle_error('Unexpected error occurred', e)
    end

    private

    def category
      Category.find(params[:id])
    end

    def update_category
      category.update!(params)

      category
    end
  end
end
