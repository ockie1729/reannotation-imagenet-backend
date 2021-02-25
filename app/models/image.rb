class Image < ApplicationRecord
  belongs_to :image_class

  validates :url, presence: true
end
