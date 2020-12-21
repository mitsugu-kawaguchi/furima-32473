class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many_attached :images
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/, message: 'Price half eidth numbers' }
    validates :description
    validates :images
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :shipping_day_id
    end
  end

  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day
end
