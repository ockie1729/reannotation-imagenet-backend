class Competition < ApplicationRecord
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
