class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:name].present?
      @items = Item.where(name: params[:name])
    elsif params[:genre_name].present?
      @items = []
      @genres = Genre.where(name: params[:genre_name])
      @genres.each do |genre|
      @items += genre.items
      end
    else
      @items = Item.page(params[:page])
    end
  end
  
  def show
    @genres = Genre.all
    if params[:name].present?
      @items = Item.where(name: params[:name])
    elsif params[:genre_name].present?
      @items = []
      @genres = Genre.where(name: params[:genre_name])
      @genres.each do |genre|
      @items += genre.items
      end
    else
    @item = Item.find(params[:id])
    end
    @cart_item = CartItem.new
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_status, :genre_id, :image)
  end
  
end
