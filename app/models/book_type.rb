class BookType < ActiveRecord::Base
  has_many :books
  validates :book_name, presence: true
  DELETE_STATUS = 1
  READY_STATUS = 0
end
