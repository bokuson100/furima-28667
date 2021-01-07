# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @item_order = FactoryBot.build(:item_order, item_id:@item.id, user_id:@user.id)
    end

    context '商品購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @item_order.building = nil
        expect(@item_order).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'postal_codeが空だと保存できないこと' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @item_order.prefecture_id = 0
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Prefecture must be greater than 0')
      end
      it 'municipalityが空だと保存できないこと' do
        @item_order.municipality = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @item_order.phone_number = 123_456_789_123
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'カード情報（token）がないと保存できないこと' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
