require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@が含まれていれば登録できる" do
        @user.email = "aaa@bbb"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で、半角英数字混合あれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれていなければ登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが6文字以上であっても、半角英数字混合でなければ登録できない" do
        @user.password = "000111"
        @user.password_confirmation = "000111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 6文字以上の半角英数字混合で入力してください")
      end
      it "ユーザー本名が空では登録できない" do
        @user.family_name = ""
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "First name can't be blank")
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "yamada"
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください", "First name 全角文字を使用してください")
      end
      it "ユーザー本名のフリガナが空では登録できない" do
        @user.family_name_kana = ""
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "First name kana can't be blank")
      end
      it "ユーザー本名のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.family_name_kana = "yamada"
        @user.first_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角カナを使用してください", "First name kana 全角カナを使用してください")
      end
      it "生年月日が空では登録できない" do
        @user.family_name = ""
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "First name can't be blank")
      end
    end
  end
end