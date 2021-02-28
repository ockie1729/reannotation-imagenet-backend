FactoryBot.define do
  factory :assignment do
    association :user
    association :image
    association :competition
  end
end
