# frozen_string_literal: true

class Base
  def self.call(...)
    new(...).execute
  end

  attr_reader :params

  def execute
    raise NotImplementedError
  end

  private

  def initialize(params)
    @params = params
  end

  def handle_error(text, error)
    Rails.logger.error("#{text}: #{error.message}")

    { success: false, error: error.message }
  end
end
