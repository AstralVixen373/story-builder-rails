class Location < ApplicationRecord
  has_many :character_locations, dependent: :destroy
  has_many :characters, through: :character_locations

  validates :name, presence: true
end
