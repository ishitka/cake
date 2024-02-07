class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(production_status: params[:order_item][:production_status])
    order = @order_item.order
    
    if params[:order_item][:production_status] == "production"
      order.update(status: "making")
    end
    
    if is_all_order_item_finish(order)
      order.update(status: "preparing_ship")
    end
    redirect_to request.referer
  end
  
  private
  
  def order_item_params
     params.require(:order_item).permit(:price, :amount, :production_status, :item_id, :order_id)
  end
  
  def is_all_order_item_finish(order)
    order.order_items.each do |order_item|
      if order_item.production_status != 'finish'
        return false
      end
    end
    return true
  end
end
