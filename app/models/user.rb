class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,              presence: true
  # validates :email,                 presence: true
  validates :password,              length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :first_name_kanji,      presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kanji,       presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,              presence: true
end
