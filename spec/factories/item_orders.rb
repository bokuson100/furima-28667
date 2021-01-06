# frozen_string_literal: true

FactoryBot.define do
  factory :item_order do
    token       { 'toke111111111111' }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '00000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
