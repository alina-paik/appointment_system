class CategoriesController < ApplicationController


  def index
  # GET /categories?page=:page
    @categories = Category.order(:name).page(params[:page])
    render json: @categories
  end
end
