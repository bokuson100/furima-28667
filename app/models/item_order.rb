# frozen_string_literal: true

class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { greater_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id) # キーはカラム名とそろえる
  end
end
