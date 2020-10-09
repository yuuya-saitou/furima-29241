class BuyerOrder

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id

  # Orderモデルのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフン（-）を入れて入力してください'}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'ひらがな、カタカナ、漢字を使用してください'}
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]|[\d]|[-]\z/}
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'ハイフン（-）は入れずに11文字以内で入力してください'}
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end

end