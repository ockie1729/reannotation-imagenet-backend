class Assignment < ApplicationRecord
  has_many :annotations

  belongs_to :user
  belongs_to :image
  belongs_to :competition
end
