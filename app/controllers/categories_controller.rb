# fronze_string_literal: true

class CategoriesController < ApplicationController
  def index
    categories = Category.all

    render json: categories
  end

  def show
    category = Category.find_by!(id: params[:id])

    render json: category
  rescue ActiveRecord::RecordNotFound => e
    render plain: 'Record not found', status: :not_found 
  end

  def create
    category = ::CategoryManager::Creator.call(allow_params)

    render json: category
  end

  def update
    category = ::CategoryManager::Updater.call(allow_params)

    render json: category
  end

  def destroy
    Category.find(params[:id]).destroy
  rescue ActiveRecord::RecordNotFound => e
    render plain: 'Record not found', status: :not_found 
  end

  private

  def allow_params
    params.permit(:id, :name)
  end
end
