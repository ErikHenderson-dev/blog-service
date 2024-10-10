# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    articles = Article.all

    render json: articles
  end

  def show
    article = Article.find_by!(id: params[:id])

    render json: article
  rescue ActiveRecord::RecordNotFound
    render plain: 'Record not found', status: :not_found
  end

  def create
    article = ::ArticleManager::Creator.call(allow_params)

    render json: article
  end

  def update
    article = ::ArticleManager::Updater.call(allow_params)

    render json: article
  end

  def destroy
    Article.find(params[:id]).destroy
  rescue ActiveRecord::RecordNotFound
    render plain: 'Record not found', status: :not_found
  end

  private

  def allow_params
    params.permit(:id, :category_id, :title, :sub_title, :text, :author)
  end
end
