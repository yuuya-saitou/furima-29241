class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: /@.+/, message: '正しいメールアドレスを使用してください'}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i, message: '6文字以上の半角英数字混合で入力してください'}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/, message: '全角カナを使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: '全角カナを使用してください' }
    validates :birthday
  end
end
