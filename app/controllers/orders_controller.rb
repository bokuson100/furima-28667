# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_item, only: %i[index new create]
  before_action :authenticate_user!

  def index
    @item_order = ItemOrder.new
     if @item.order.present? || current_user.id == @item.user.id # 売れている状態
        redirect_to root_path
     end
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_order_params
    params.require(:item_order).permit(:token, :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # price情報は無いが記述は必要
      card: item_order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類(日本円)
    )
  end

end
