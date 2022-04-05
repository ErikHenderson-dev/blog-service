# fronze_string_literal: true

class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    articles = Article.all

    render json: articles
  end

  def show
    article = Article.find_by(id: allow_params[:id])

    render json: article
  end

  def create
    article = Creators::ArticleCreator.call(allow_params)

    render json: article
  end

  def destroy
    Article.where(id: allow_params[:id]).destroy_all
  end

  private

  def allow_params
    params.permit(:id, :category_id, :title, :sub_title, :publication_date, :text, :author)
  end
end
