class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(status:order_params[:status])
    order_items = @order.order_items
    
    if params[:order][:status] == "confirm_paymethod"
       order_items.update(production_status: "waiting")
    end
    redirect_to request.referer
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :shipping_cost, :invoice_amount, :postal_code, :address, :name, :status, :customer_id)
  end
end
