class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates  :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    User.find_by(email: email.strip.downcase).try(:authenticate, password)
  end

end
