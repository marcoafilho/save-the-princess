# `Account` handles the account profile and the account authentication
class Account < ActiveRecord::Base
  EMAIL_REGEX = /\A.+@.+\z/
  USERNAME_REGEX = /\A[0-9a-zA-Z][0-9a-zA-Z-]*[0-9a-zA-Z]\z/

  has_secure_password

  has_many :worlds

  validates :username, presence: true, uniqueness: true, format: { with: USERNAME_REGEX }
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 6 }, unless: 'password.nil?'

  def self.with_credential(value)
    where('email = :value OR username = :value', value: value).first
  end

  def avatar_url
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end

  def to_param
    username.downcase
  end

  def to_s
    name.presence || username
  end
end
