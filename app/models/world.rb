# `World` handles the playable worlds available in the game.
class World < ActiveRecord::Base
  belongs_to :user

  scope :owner, -> (nickname) { joins(:user).where('users.name = ?', nickname) if nickname }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :map_path, presence: true
end
