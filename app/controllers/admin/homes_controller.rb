class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
    def top
      @orders = Order.page(params[:page])
      @order_items = OrderItem.where(order_id: @orders.pluck(:id))
    end
end
