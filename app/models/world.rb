# `World` handles the playable worlds available in the game.
class World < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
