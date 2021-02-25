class Annotation < ApplicationRecord
  belongs_to :image
  belongs_to :annotation_label
  belongs_to :user
  belongs_to :assignment
end
