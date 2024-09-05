class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :book_id, presence: true
  validates :user_id, presence: true
  validate  :book_must_have_sufficient_stock

  def book_must_have_sufficient_stock
    return if book.nil? || quantity <= book.available_quantity

    errors.add(:quantity, "Excede el stock")
  end
end
