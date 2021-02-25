class Competition < ApplicationRecord
  has_many :assignments
  has_many :annotations

  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
