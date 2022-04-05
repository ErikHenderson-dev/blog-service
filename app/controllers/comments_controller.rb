# fronze_string_literal: true

class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    comments = Comment.all

    render json: comments
  end

  def show
    comment = Comment.find_by(id: allow_params[:id])

    render json: comment
  end

  def create
    comment = Creators::CommentCreator.call(allow_params)

    render json: comment
  end

  def destroy
    Comment.where(id: allow_params[:id]).destroy_all
  end

  private

  def allow_params
    params.permit(:id, :article_id, :comment)
  end
end
