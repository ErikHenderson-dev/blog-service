# fronze_string_literal: true

class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    articles = Article.all

    render json: articles
  end

  def show
    category = Article.find_by(id: allow_params[:id])

    render json: category
  end

  def create
    Article.create(
      id: allow_params[:id],
      category_id: allow_params[:category_id],
      title: allow_params[:title],
      sub_title: allow_params[:sub_title],
      publication_date: allow_params[:publication_date],
      text: allow_params[:text],
      author: allow_params[:author]
    )
  end

  def destroy
    Article.where(id: allow_params[:id]).destroy_all
  end

  private

  def allow_params
    params.permit(:id, :category_id, :title, :sub_title, :publication_date, :text, :author)
  end
end
