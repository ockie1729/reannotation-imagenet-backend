FactoryBot.define do
  factory :assignment do
    user { build(:user) }
    image { build(:image) }
    competition { build(:competition) }
  end
end
