require 'rails_helper'

  # pending "add some examples to (or delete) #{__FILE__}"
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
  context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが6文字以下であれば登録できる' do
      @user.nickname = "gggggg"
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ""
      @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    end
    it 'nicknameが7文字以上では登録できない' do
      @user.nickname = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "aaaaa"
      @user.password_confirmation = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    # it 'nicknameが空では登録できない' do
      # user = FactoryBot.build(:user)  # Userのインスタンス生成
      # @user.nickname = ''  # nicknameの値を空にする
      # @user.valid?
      # expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end
    # it 'emailが空では登録できない' do
      # user = FactoryBot.build(:user)  # Userのインスタンス生成
      # @user.email = ''  # nicknameの値を空にする
      # @user.valid?
      # expect(@user.errors.full_messages).to include("Email can't be blank")
    # end
  end
 end
end
