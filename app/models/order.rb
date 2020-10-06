class Order < ApplicationRecord
  belongs_to :buyer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code, 
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address,
    validates :phone_number,
  end

  validates :building_name, 
  
end
