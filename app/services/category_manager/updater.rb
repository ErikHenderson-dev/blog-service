# fronze_string_literal: true

module CategoryManager
  class Updater < ::Base
    def execute
      update_category
    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.error("Failed to update category: #{e.message}")

      { success: false, error: e.message }
    rescue  ActiveRecord::RecordInvalid => e
      Rails.logger.error("Failed to update category: #{e.message}")

      { success: false, error: e.message }
    rescue StandardError => e
      Rails.logger.error("Unexpected error occurred: #{e.message}")

      { success: false, error: e.message }
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