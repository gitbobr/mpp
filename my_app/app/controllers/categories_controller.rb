class CategoriesController < ApplicationController
  def show
    category = Category.find_by(id: params[:id])
    if category.present?
      @products_title = "Category #{category.category_name}"
      @products = Product.where(category_id: category.id)
    else
      @products_title = "All furniture"
      @products = Product.all
    end
    if params[:sort_by].present?
      @products = @products.order("#{params[:sort_by]} #{params[:direction]}")
    end
  end
end
