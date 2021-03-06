FactoryBot.define do
  factory :task do
    name Faker::App.name
    description Faker::Lorem.paragraph
    template Faker::Lorem.paragraph

    factory :task_with_attempts do
      transient do
        attempts_count 3
      end

      after(:create) do |task, evaluator|
        FactoryBot.create_list(:attempt, evaluator.attempts_count, task: task)
      end
    end

    factory :task_with_solutions do
      transient do
        solutions_count 3
      end

      after(:create) do |task, evaluator|
        FactoryBot.create_list(:solution, evaluator.solutions_count, task: task)
      end
    end
  end
end
