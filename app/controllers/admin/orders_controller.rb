class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confirm"
      @order.order_details.each do |detail|
        detail.update(making_status: "wait")
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
