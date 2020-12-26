# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    association         :user
    item_name           { 'hoge' }
    text                { 'hoge' }
    status_id           { 1 }
    delivery_burden_id  { 1 }
    category_id         { 1 }
    prefecture_id       { 1 }
    delivery_days_id    { 1 }
    price               { 9999 }
  end
end
