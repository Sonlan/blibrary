class Book < ActiveRecord::Base
  belongs_to :book_types
  has_many :borrow_records
  has_many :users, through: :borrow_records
  validates :book_type_id, :serial_code, presence: true
  READY = 0
  BORROWING = 1
  ALL = 2
end
