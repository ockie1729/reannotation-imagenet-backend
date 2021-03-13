FactoryBot.define do
  factory :image do
    association :image_class
    sequence(:url) { |n| "https://example.com/images/example_#{n}.png" }
  end
end
