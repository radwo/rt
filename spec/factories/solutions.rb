FactoryBot.define do
  factory :solution do
    task
    input Faker::Lorem.word
    output Faker::Number.between(1, 100)
  end
end
