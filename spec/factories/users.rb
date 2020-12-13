# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name_kanji      { '山田' }
    last_name_kanji       { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday              { '2020-11-13' }
  end
end
