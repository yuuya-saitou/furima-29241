class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  validates :image, :name, :explanation, :category_id, :status_id,
            :delivery_fee_id, :shipping_area_id, :shipping_days_id, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :shipping_area_id,
            :shipping_days_id, numericality: { other_than: 1 } 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}, presence: true
end
