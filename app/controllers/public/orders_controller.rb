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
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:status, :post_code, :address, :name)
  end
end
