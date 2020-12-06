class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #ユーザー情報
  validates :nickname, presence: {message:'ニックネームは必須です。'}
  validates :uniqueness: {message: 'そのアドレスは既に登録されています。'}
  validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'パスワードは6文字以上かつ英数字をそれぞれ含めてください' }

  #本人情報確認
  validates :first_name_kanji, presence: true
  validates :last_name_kanji, presence: true 
  validates :first_name_kana, presence: true
  validates :last_name_kana,  presence: true
  validates :birthday,  presence: true
end
