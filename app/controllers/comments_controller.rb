# fronze_string_literal: true

class CommentsController < ApplicationController
  def index
    comments = Comment.all

    render json: comments
  end
end
