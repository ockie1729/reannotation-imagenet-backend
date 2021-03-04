FactoryBot.define do
  factory :annotation do
    association :annotation_label
    association :assignment
    user { assignment.user }
  end
end
