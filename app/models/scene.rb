class Scene < ApplicationRecord
  belongs_to :chapter

  validates :position, presence: true
end
