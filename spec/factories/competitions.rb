FactoryBot.define do
  factory :competition do
    starts_at { "2000-01-01 22:31:32" }
    ends_at { "2030-01-01 22:31:32" }
    title { "Title" }
    explanation { "Explanation" }
  end
end
