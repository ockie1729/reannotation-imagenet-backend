FactoryBot.define do
  factory :image do
    association :image_class
    url { "https://example.com/images/example.png" }
  end
end
