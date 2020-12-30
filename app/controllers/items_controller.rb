# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all.order('created_at ASC')
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

  def show; end

  def edit; end

  def update
    if current_user.id == @item.user_id?

      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit # edit.html.erbに遷移
      end

    else redirect_to root_path
    end
  end

  def destroy
    if  current_user.id == @item.user_id?

      @item.destroy
      redirect_to root_path

    else
      render :index
    end

  end

  private

  def set_item 
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :image, :text, :category_id, :delivery_burden_id, :delivery_days_id, :prefecture_id, :status_id, :price).merge(user_id: current_user.id)
  end
end
