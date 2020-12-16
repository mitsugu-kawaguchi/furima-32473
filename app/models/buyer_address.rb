class BuyerAddress

  include ActiveModel::Model
  attr_accessor :post_code, :city, :address, :phone_number, :prefecture_id, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :post_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: ""}
    validates :city
    validates :address
    validates :phone_number,  format: {with: /\A\d{11}\z/, message: ""}
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id )
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building_name: building_name,purchase_id: purchase.id)
  end
end