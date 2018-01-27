FactoryBot.define do
  factory :attempt do
    code Faker::Lorem.paragraph
    final false
    task
  end
end
