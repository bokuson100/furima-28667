# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_item, only: %i[index new create]
  before_action :move_to_new_user_session

  def index
    redirect_to root_path if @item.order.present? # 売れている状態
    @item_order = ItemOrder.new
  end

  def new
    @item_order = ItemOrder.new
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

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
