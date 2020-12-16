# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    # nameとemailはデフォルトで設定
    validates :nickname
    validates :password,              length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ }
    validates :password_confirmation, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ }
    validates :first_name_kanji,      format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_kanji,       format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana,       format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_kana,        format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
