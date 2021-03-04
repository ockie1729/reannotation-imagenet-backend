FactoryBot.define do
  factory :annotation do
    association :annotation_label
    association :assignment
    association :user
  end
end
