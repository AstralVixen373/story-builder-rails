class Character < ApplicationRecord
  has_many :character_relationships, dependent: :destroy
  has_many :linked_characters, through: :character_relationships
  has_many :inverse_character_relationships, class_name: "CharacterRelationship", foreign_key: :linked_character_id, dependent: :destroy
  has_many :inverse_linked_characters, through: :inverse_character_relationships, source: :character

  has_many :character_locations, dependent: :destroy
  has_many :locations, through: :character_locations

  validates :name, presence: true
end
