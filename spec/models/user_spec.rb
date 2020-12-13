require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "" do
      end
      it "nicknameが6文字以下で登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it 'password:半角英数混合（半角英語のみ）' do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", :)
        user.valid?
        binding.pry
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが英字だけでは登録出来ない" do
      end
      it "passwordが数字だけでは登録出来ない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
    end
  end

  describe '本人情報確認' do
    context '本人情報確認が上手くいくとき' do
    end
    context '本人情報確認が上手くいかないとき' do
    end
  end

end
