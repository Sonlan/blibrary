class User < ActiveRecord::Base
  ADMIN = 0
  USER = 1
  before_save { self.mail = mail.downcase }
  validates :user_name, presence: true, length: { maximum: 50 },
                        uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
