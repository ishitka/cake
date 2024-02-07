class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :cartitem_nill, only: [:new, :confirm, :create]
  def new
    @order = Order.new
    @addresses = Address.where(id: current_customer.address_ids)
  end
      
  def confirm
    @total_amount = 0
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
  end
  
  def create
     @order = Order.new(order_params)
     @order.save
     @cart_items = current_customer.cart_items.all
     @cart_items.each do |cart_item|
       @order_items = OrderItem.new
       @order_items.order_id = @order.id
       @order_items.item_id = cart_item.item.id
       @order_items.price = cart_item.item.with_tax_price
       @order_items.amount = cart_item.amount
       @order_items.production_status = 0
       @order_items.save!
     end
     CartItem.destroy_all
     redirect_to complete_order_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_cost, :invoice_amount, :postal_code, :address, :name, :status, :customer_id)
  end
  
  def cartitem_nill
    cart_items = current_customer.cart_items
    if cart_items.blank?
      redirect_to cart_items_path
    end
  end 
end

