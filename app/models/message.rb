class Message < ActiveRecord::Base
  belongs_to :users
  validates :user_id, :sender_id, :content, :title, presence: true

  BOOK_EXPIR_REMINDER = '书籍到期提醒'.freeze
  SYSTEM_NOTICE = 0
  ADMIN_NOTICE = 1

  def self.book_expir_content(book_name)
    '您所借的图书《' + book_name + '》即将到期，请及时归还！'
  end
end
