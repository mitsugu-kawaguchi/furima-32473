class Destination < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :post_code,  format: {with: /\A\d{3}[-]\d{4}\z/, message: "Post_code is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number,  format: {with: /\A\d{11}\z/, message: ""}
    validates :prefecture_id, numericality: { other_than: 1 }
  end
end
