class ProfileController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @orders = Order.where("user_id = #{current_user.id} AND order_status != 'Cart'")
  end
end
