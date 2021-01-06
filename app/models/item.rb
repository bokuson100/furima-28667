# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category # （コントローラのクラス名と一致）
  belongs_to :status
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :delivery_days
  belongs_to :user
  has_one    :order

  with_options presence: true do
    validates :image
    validates :item_name
    validates :text
    validates :category_id, :delivery_burden_id, :delivery_days_id, :prefecture_id, :status_id, numericality: { other_than: 0 } # バリデーションはカラム名と一致
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
  end
