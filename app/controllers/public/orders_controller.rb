class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    #binding.pry
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    if params[:order][:address_number] == "0"
      @order.post_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "1"
      @address = Address.find(params[:order][:address_id].to_i)
      @order.post_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    current_customer.cart_items.each do | cart_item |
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.non_taxed_price
      order_detail.amount = cart_item.amount
      order_detail.making_status = "cant"
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :customer_id, :total_payment)
  end
end
