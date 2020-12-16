class BuyerAddress

  include ActiveModel::Model
  attr_accessor :nickname, :birthday, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :name, :price, :description, :image, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :post_code, :city, :address, :phone_number, :prefecture_id

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]/, message: 'Full-width characters' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
      validates :family_name_kana
      validates :first_name_kana
    end
    validates :name
    validates :description
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/, message: 'Price half eidth numbers' }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :shipping_day_id
    end
    validates :post_code,  format: {with: /\A\d{11}\z/, message: ""}
    validates :city
    validates :address
    validates :phone_number,  format: {with: /\A\d{3}[-]\d{4}\z/, message: ""}
  end

  def save
    user =  User.create(nickname: nickname, email: email, password: password, first_name: first_name, family_name: family_name, first_name_kana: first_name_kana, family_name_kana: family_name_kana, birth_day: birth_day)
    Item.create(name: name, description: description, image: image, price: price,category_id: category_id, status_id: status_id, shipping_cost_id: shipping_cost_id, prefecture_id: prefecture_id,shipping_day_id: shipping_day_id, user_id: user.id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number, building_name: building_name, purchase_id: purchase.id)
    Purchase.create(user_id: user.id, item_id: item.id)
  end
end