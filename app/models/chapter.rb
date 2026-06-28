class Chapter < ApplicationRecord
  has_many :scenes, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true
  validates :position, presence: true
end
