class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, presence: true,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }
  validates :family_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]/,message: 'Full-width characters'}
  validates :first_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]/,message: 'Full-width characters'}
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/,message: 'Full-width katakana characters'}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/,message: 'Full-width katakana characters'}
end
