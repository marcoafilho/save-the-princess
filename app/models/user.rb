# `User` handles the user profile and the user authentication
class User < ActiveRecord::Base
  has_secure_password

  has_many :worlds

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\z/ }
  validates :password, length: { minimum: 6 }
end
