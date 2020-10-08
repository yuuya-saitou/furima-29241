class BuyerOrder

  include ActiveModel::Model
  attr_accessor :token, :price, :number, :exp_month, :exp_year, :cvc, :id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id

  # Orderモデルのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフン（-）を入れて入力してください'}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]|[\d]\z/, message: 'ひらがな、カタカナ、漢字を使用してください'}
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]|[\d]|[-]\z/}
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'ハイフン（-）は入れずに11文字以内で入力してください'}
    validates :token
  end
  validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]|[a-z\d]\z/}

  def save
    buyer = Buyer.create(user_id: current_user.id, item_id: item_id)
    Order.create(token: token, price: price, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, buyer_id: buyer.id)
  end

end