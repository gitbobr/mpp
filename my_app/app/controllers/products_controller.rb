class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @category = Category.find(@product.category_id)
  end
end
