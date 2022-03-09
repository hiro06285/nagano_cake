class CustomersController < ApplicationController
  def show
    @customer = Customer.page(params[:page]).per(10)
  end
  
  def edit
  end
  
  def update
  end
  
  def unsubscribe
  end
  
  def withdraw
  end
end
