class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # validates :name, presence: true
  # validates :explanation, presence: true
  # validates :category_id, presence: true
  # validates :status_id 
  # validates :delivery_fee_id
  # validates :shipping_area_id
  # validates :shipping_days_id
  # validates :price
  # validates :user, foreign_key: true
end
