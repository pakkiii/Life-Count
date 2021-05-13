require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    
    context '正常系' do
      it "全ての情報が指定された内容通り存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の半角英数字両方を含む値でなおかつ同値あれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it "nick_nameが空では登録できない" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailが@を含んでいないと登録できない" do
        @user.email = 'kkjj898'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailがすでに登録されていれば登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが6文字以上でないと登録できない' do
        @user.password = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角では登録できない' do
        @user.password = '１１１DFG'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end



    end
  end
end
