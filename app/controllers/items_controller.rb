# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
   end
end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :text, :category_id, :delivery_burden_id, :delivery_days_id, :prefecture_id, :status_id, :price).merge(user_id: current_user.id)
  end
end
