class Public::HomesController < ApplicationController
  def top
    #@item = Item.page(params[:page]).per(4)
    @item = Item.order('id DESC').limit(4)
  end

  def about
  end
end
