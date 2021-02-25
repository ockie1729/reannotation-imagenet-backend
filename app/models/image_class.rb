class ImageClass < ApplicationRecord
  has_many :images

  validates :synset, presence: true, uniqueness: true
end
