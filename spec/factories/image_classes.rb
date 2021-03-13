FactoryBot.define do
  factory :image_class do
    sequence(:name) { |n| "n000#{n}" }
    sequence(:synset) { |n| "example_#{n}" }
  end
end
