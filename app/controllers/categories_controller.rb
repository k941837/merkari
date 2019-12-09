class CategoriesController < ApplicationController

  def index
    @brands = Brand.search(params[:keyword])
  end

  def show
    @brand_cat = Brand.find(params[:id])

  end
end
