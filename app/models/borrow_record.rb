class BorrowRecord < ActiveRecord::Base
  validates :user_id, :book_id, presence: true
  RETURNED = 0
  BORROWING = 1
end
