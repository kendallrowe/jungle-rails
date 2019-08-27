class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }
  validates :password, presence: true
  validates :password_confirmation, presence: true

end
