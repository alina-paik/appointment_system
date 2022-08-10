# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    # GET /categories?page=:page
    categories = Categories::Search.call(page: params[:page])
    render json: categories
  end
end
