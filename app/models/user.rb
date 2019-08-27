class User < ActiveRecord::Base

  has_secure_password

  before_save :downcase_fields

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.strip.downcase).try(:authenticate, password) 
    @user ? @user : nil
  end

  def downcase_fields
    self.email.downcase!
    self.email.strip!
  end

end
