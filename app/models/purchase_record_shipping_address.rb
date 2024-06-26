class PurchaseRecordShippingAddress
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :municipalities, :street_address, :token
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' }, length: { minimum: 10, maximum: 11 }
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end

end
