# `Account` handles the account profile and the account authentication
class Account < ActiveRecord::Base
  has_secure_password

  has_many :worlds

  scope :with_credential, -> (string) { where('email = :string OR username = :string', string: string).first }

  validates :username, presence: true, format: { with: /\A[0-9a-zA-Z][0-9a-zA-Z-]*[0-9a-zA-Z]\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\z/ }
  validates :password, length: { minimum: 6 }

  def avatar_url
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end

  def to_param
    username.downcase
  end

  def to_s
    name || username
  end
end
