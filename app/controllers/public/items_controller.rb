class Public::ItemsController < ApplicationController
  def index
    @item = Item.page(params[:page]).per(8)
  end

  def show
  end
end
