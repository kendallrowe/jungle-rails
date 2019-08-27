class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email).try(:authenticate, password) 
    @user ? @user : nil
  end

end
