class Order < ApplicationRecord
  belongs_to :buyer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
