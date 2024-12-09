class Recipe < ApplicationRecord
  validates :title, :ingredients, :instructions, presence: true
  belongs_to :user
  has_one_attached :image
end
