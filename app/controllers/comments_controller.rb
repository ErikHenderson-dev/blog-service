# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    comments = Comment.all

    render json: comments
  end

  def show
    comment = Comment.find_by!(id: params[:id])

    render json: comment
  rescue ActiveRecord::RecordNotFound
    render plain: 'Record not found', status: :not_found
  end

  def create
    comment = ::CommentManager::Creator.call(allow_params)

    render json: comment
  end

  def update
    comment = ::CommentManager::Updater.call(allow_params)

    render json: comment
  end

  def destroy
    Comment.find(params[:id]).destroy
  rescue ActiveRecord::RecordNotFound
    render plain: 'Record not found', status: :not_found
  end

  private

  def allow_params
    params.permit(:id, :article_id, :text)
  end
end
