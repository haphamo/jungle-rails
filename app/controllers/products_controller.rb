class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    # implicit render
  end

  def show
    @product = Product.find params[:id]
  end

end
