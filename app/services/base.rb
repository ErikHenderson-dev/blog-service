# fronze_string_literal: true

class Base
  def self.call(*args)
    new(*args).execute
  end

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def execute
    raise NotImplementedError
  end
end
