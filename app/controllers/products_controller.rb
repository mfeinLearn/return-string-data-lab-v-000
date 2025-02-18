class ProductsController < ApplicationController

  def index
    @products = Product.all
  end
  #
  def new
    @product = Product.new

  end

  def create
    #binding.pry
   @product = Product.create(product_params)
   redirect_to products_path
  end

  def inventory
    @product = Product.find(params[:id])
    #binding.pry
    render plain: @product.inventory > 0  ? true : false

  end

  def description
    @product = Product.find(params[:id])

    render plain: @product.description
  end

  private
  def product_params
  #binding.pry
   params.require(:product).permit(:name, :inventory, :price, :description)
  end

end
