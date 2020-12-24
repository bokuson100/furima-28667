# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end

  it '全ての項目の入力が存在すれば登録できること' do
    expect(@item).to be_valid
  end

  # 画像は1枚必須であること(ActiveStorageを使用すること)
  it '画像が一枚以上ないと保存出来ないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Image can't be blank"
  end

  # 商品名が必須であること
  it '商品名が空では保存出来ないこと' do
    @item.item_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Item name can't be blank"
  end

  # 商品の説明が必須であること
  it '商品の説明が空では保存出来ないこと' do
    @item.text = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Text can't be blank"
  end

  # カテゴリーの情報が必須であること
  it 'カテゴリーの情報が空では保存出来ないこと' do
    @item.category_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include 'Category must be other than 0'
  end

  # 商品の状態についての情報が必須であること
  it '商品の状態が空では保存出来ないこと' do
    @item.status_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include 'Status must be other than 0'
  end

  # 配送料の負担についての情報が必須であること
  it '配送料の負担について情報が空では保存出来ないこと' do
    @item.delivery_burden_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include 'Delivery burden must be other than 0'
  end

  # 発送元の地域についての情報が必須であること
  it '発送元の地域について情報が空では保存出来ないこと' do
    @item.prefecture_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include 'Prefecture must be other than 0'
  end

  # 発送までの日数についての情報が必須であること
  it '発送まで日数の情報が空では保存出来ないこと' do
    @item.delivery_days_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include 'Delivery days must be other than 0'
  end

  # 価格についての情報が必須であること
  it '価格についての情報が空では保存出来ないこと' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Price can't be blank"
  end

  # 価格の範囲が、¥300~¥9,999,999の間であること
  it '価格の範囲が￥299以下では保存出来ないこと' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
  end

  it '価格の範囲が￥10000000以上では保存出来ないこと' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
  end

  # 販売価格は半角数字のみ保存可能であること
  it '価格は全角数字では保存できないこと' do
    @item.price = '１２３４５６７'
    @item.valid?
    expect(@item.errors.full_messages).to include 'Price is not a number'
  end
end
