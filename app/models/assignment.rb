class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :image
  belongs_to :competition
end
