# fronze_string_literal: true

class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    categories = Category.all

    render json: categories
  end

  def show
    category = Category.find_by(id: allow_params[:id])

    render json: category
  end

  def create
    Category.create(id: allow_params[:id], category: allow_params[:category])
  end

  def destroy
    Category.where(id: allow_params[:id]).destroy_all
  end

  private

  def allow_params
    params.permit(:id, :category)
  end
end
