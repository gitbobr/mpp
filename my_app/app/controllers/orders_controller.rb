class OrdersController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    order = current_order
    order_item = OrderProduct.find_by(order_id: order.id, product_id: params[:product_id])
    if order_item.present?
      redirect_to "/products/#{params[:product_id]}", alert: 'The item is already in the cart'
    else
      OrderProduct.create(order_id: order.id, product_id: params[:product_id], amount: 1)
      redirect_to "/products/#{params[:product_id]}", notice: 'The item is successfully added to the cart'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to "/profile"
  end

  def index
    @order = current_order
    @order_items = OrderProduct.where(order_id: @order.id)
  end

  def update_quantity
    order_item = OrderProduct.find(params[:id])
    if params[:quantity].to_i <= 0
      order_item.destroy
    elsif params[:quantity].to_i <= order_item.product.quantity
      order_item.update(amount: params[:quantity])
    end
    redirect_to "/orders"
  end

  def checkout
    order = current_order
    if OrderProduct.where(order_id: order.id).count < 1
      redirect_to "/orders", alert: "The cart is empty"
    else
      order.update(order_status: 'New order', order_date: Time.now)
      redirect_to "/orders", notice: "The order has been successfully created and added to your profile"
    end
  end

  private

  def current_order
    order = Order.find_by(order_status: 'Cart', user_id: current_user.id)
    if not order.present?
      order = Order.create(user_id: current_user.id, order_status: 'Cart', order_date: Time.now)
    end
    order
  end
end
