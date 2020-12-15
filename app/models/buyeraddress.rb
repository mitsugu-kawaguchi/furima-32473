class BuyerAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :phone_number, :purchase, :building_name, :user, :item

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :post_code,  format: {with: /\A\d{11}\z/, message: ""}
    validates :city
    validates :address
    validates :phone_number,  format: {with: /\A\d{3}[-]\d{4}\z/, message: ""}
    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
  end

  def save
    # 住所の情報を保存
    Destination.create(post_code: post_code, city: city, address: address, prefecture: prefecture, phone_number: phone_number, building_name: building_name,purchase_id: purchase.id)
    # 寄付金の情報を保存
    Purchase.create(item_id: item.id, user_id: user.id)
  end
end