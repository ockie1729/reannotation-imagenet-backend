FactoryBot.define do
  factory :annotation do
    image { Image.new }
    annotation_label { AnnotationLabel.new }
    user { User.new }
    assignment { Assignment.new }
  end
end
