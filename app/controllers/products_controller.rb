class ProductsController < ApplicationController
  def index
    @categories = Category.all
    if params[:search]
      @products  = Product.search(params[:search]).order("created_at ASC")
    else
      @products = Product.all.order("created_at ASC")
    end
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end


end
