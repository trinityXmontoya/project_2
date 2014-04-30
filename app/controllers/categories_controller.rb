class CategoriesController < ApplicationController

  def index
    @categories = Category.new
  end
