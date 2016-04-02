# `World` handles the playable worlds available in the game.
class World < ActiveRecord::Base
  belongs_to :account
  has_many :locations

  scope :owner, -> (username) { joins(:account).where('accounts.username = ?', username) if username }

  validates :account, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :map_path, presence: true

  def owner?(object)
    object == account
  end

  def to_s
    name
  end
end
