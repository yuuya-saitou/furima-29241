require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      @buyer_order = FactoryBot.build(:buyer_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer_order).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @buyer_order.postal_code = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buyer_order.postal_code = '1234567'
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Postal code ハイフン（-）を入れて入力してください")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @buyer_order.prefecture_id = 1
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'municipalityが空だと保存できないこと' do
      @buyer_order.municipality = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'municipalityが全角かな、カナ、漢字でないと保存できないこと' do
      @buyer_order.municipality = "大阪市abenoku"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Municipality ひらがな、カタカナ、漢字を使用してください")
    end
    it 'addressが空だと保存できないこと' do
      @buyer_order.address = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Address can't be blank", "Address is invalid")
    end
    it 'building_nameは空でも保存できること' do
      @buyer_order.building_name = nil
      expect(@buyer_order).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @buyer_order.phone_number = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフンを含むと保存できないこと' do
      @buyer_order.phone_number = '000-1111-2222'
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Phone number ハイフン（-）は入れずに11文字以内で入力してください")
    end
    it 'tokenが空では保存できないこと' do
      @buyer_order.token = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end