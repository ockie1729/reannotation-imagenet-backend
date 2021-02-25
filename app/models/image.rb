class Image < ApplicationRecord
  belongs_to :image_class
  has_many :assignments
  has_many :annotations

  validates :url, presence: true
end
