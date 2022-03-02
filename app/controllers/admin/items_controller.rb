class Admin::ItemsController < ApplicationController
  def index
    @item = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :non_taxed_price, :sales_status)
  end
end
