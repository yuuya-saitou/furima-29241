class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_days_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_days_id
  end
end
