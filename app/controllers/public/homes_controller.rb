class Public::HomesController < ApplicationController
  def top
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
      @items = Item.order('id DESC').limit(4)
    end
  end
  
  def about
  end
end
