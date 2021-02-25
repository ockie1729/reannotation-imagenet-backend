class ImageClass < ApplicationRecord
  validates :synset, presence: true, uniqueness: true
end
