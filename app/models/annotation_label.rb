class AnnotationLabel < ApplicationRecord
  has_many :annotations

  validates :explanation, presence: true
end
