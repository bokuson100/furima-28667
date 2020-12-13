require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

      it "全ての項目の入力が存在すれば登録できること" do
         expect(@user).to be_valid
      end

      #ニックネームが必須であること
      it "nicknameが空だと登録できない" do
         @user.nickname = ""  # nicknameの値を空にする
         @user.valid?
         expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      #メールアドレスが必須であること
      it "emailが空では登録できない" do
         @user.email = ""
         @user.valid?
         expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      
      #メールアドレスが一意性であること
      it "重複したemailが存在する場合登録できない" do
         @user.save
         another_user = FactoryBot.build(:user,email:@user.email)
         another_user.valid?
         expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
     
      #メールアドレスは@を含む必要があること
      #パスワードが必須であること
      it "passwordが空では登録できない" do
         @user.password = ""
         @user.valid?
         expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      
      #パスワードは6文字以上であること
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        expect(@user).to be_valid
       end

      it "passwordが5文字以下であれば登録できない" do
         @user.password = "12345"
         @user.password_confirmation = "12345"
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation is too short (minimum is 6 characters)")
       end

      it "passwordは英字と数字があれば登録できる" do
         @user.password = "12345"+"abcdef"
         @user.password_confirmation = "12345"+"abcdef"
         expect(@user).to be_valid
      end

      #パスワードは確認用を含めて2回入力すること
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
         @user.password_confirmation = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      #ユーザー本名が、名字と名前がそれぞれ必須であること
      it "first_name_kanjiが空では登録出来ない" do
         @user.first_name_kanji = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end

      it "last_name_kanjiが空では登録出来ない" do
         @user.last_name_kanji = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      #ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
      it "first_name_kanjiが半角では登録出来ない" do
         @user.first_name_kanji = "abcde"
         @user.valid?
         expect(@user.errors.full_messages).to include("First name kanji is invalid")
      end

      it "last_name_kanjiが半角では登録出来ない" do
         @user.last_name_kanji = "abcde"
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name kanji is invalid")
      end

      #ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
      it "first_name_kanaが空では登録出来ない" do
         @user.first_name_kana = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_name_kanaが空では登録出来ない" do
         @user.last_name_kana = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      #ユーザー本名のフリガナは全角（カタカナ）で入力させること
      it "first_name_kanaが全角カタカナでなければ登録出来ない" do
         @user.first_name_kana = "あいうえお"
         @user.valid?
         expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "last_name_kanaが全角カタカナでなければ登録出来ない" do
         @user.last_name_kana = "あいうえお"
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      #生年月日が必須であるこ
      it "birthdayが無い場合は登録出来ない" do
         @user.birthday = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
end
