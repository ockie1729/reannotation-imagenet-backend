FactoryBot.define do
  factory :image do
    image_class { build(:image_class) }
    url { "https://example.com/images/example.png" }
  end
end
