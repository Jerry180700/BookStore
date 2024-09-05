class Book < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :seller, through: :orders, source: :user
  has_many :buyers, through: :orders, source: :user
  has_many :users, through: :orders

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :available_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
