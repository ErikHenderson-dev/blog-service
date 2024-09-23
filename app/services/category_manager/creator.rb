# fronze_string_literal: true

module CategoryManager
  class Creator < ::Base
    def execute
      create_category
    rescue  ActiveRecord::RecordInvalid => e
      Rails.logger.error("Failed to create category: #{e.message}")

      { success: false, error: e.message }
    rescue StandardError => e
      Rails.logger.error("Unexpected error occurred: #{e.message}")

      { success: false, error: e.message }
    end

    private

    def create_category
      Category.create!(name: params[:name])
    end
  end
end
