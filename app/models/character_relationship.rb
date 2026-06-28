class CharacterRelationship < ApplicationRecord
  belongs_to :character
  belongs_to :linked_character, class_name: "Character"
end
