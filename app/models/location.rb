# `Location` is the place where players can send their parties to run errands.
class Location < ActiveRecord::Base
  validates :world_id, presence: true
  validates :name, presence: true, uniqueness: { scope: [:world_id, :latitude, :longitude] }
  validates :longitude, presence: true
  validates :latitude, presence: true
end
