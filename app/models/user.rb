# `User` handles the user profile and the user authentication
class User < ActiveRecord::Base
  has_secure_password

  has_many :worlds

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\z/ }
  validates :password, length: { minimum: 6 }

  def avatar_url
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end

  def to_param
    name
  end

  def to_s
    name
  end
end
