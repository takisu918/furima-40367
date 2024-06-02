class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_payer, class_name: 'ShippingFeePayer'
  belongs_to :prefecture
  belongs_to :days_until_shipping, class_name: 'DaysUntilShipping'

  validates :name, :description, :price, :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_fee_payer_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_until_shipping_id, numericality: { other_than: 1 , message: "can't be blank"} 

end
