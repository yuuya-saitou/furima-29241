require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    # user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品機能がうまくいくとき' do
      it "全項目が存在すれば出品できる" do
        expect(@item).to be_valid
      end
      it "販売価格が300円以上9,999,999円以下であれば出品できる" do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '出品機能がうまくいかないとき' do
      it "商品画像が無い場合は出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が無い場合出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が無い場合出品できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "商品カテゴリが未選択の場合出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品状態が未選択の場合出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担が未選択の場合出品できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "配送元の地域が未選択の場合出品できない" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "配送までの日数が未選択の場合出品できない" do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
      end
      it "販売価格が300円〜9,999,999円以内でなければ出品できない" do
        @item.price = 50
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end