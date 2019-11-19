class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, length: {minimum: 5, too_short: "length is too short"}
  validates :email, format: { without: /\s/ }

  def self.authenticate_with_credentials(email, password)
    trimmed_email = email.strip
    user = User.find_by_email(trimmed_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end

  end

end
