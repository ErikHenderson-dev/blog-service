# frozen_string_literal: true

module CategoryManager
  class Creator < ::Base
    def execute
      create_category
    rescue ActiveRecord::RecordInvalid => e
      handle_error('Failed to create category', e)
    rescue StandardError => e
      handle_error('Unexpected error occurred', e)
    end

    private

    def create_category
      Category.create!(name: params[:name])
    end
  end
end
