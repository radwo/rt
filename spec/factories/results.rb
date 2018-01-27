FactoryBot.define do
  factory :result do
    expected "MyString"
    output "MyString"
    attempt
    done nil

    factory :result_done do
      done true

      factory :result_with_invalid_output do
        output "YourString"
      end
    end

    factory :result_not_done do
      done false
    end
  end
end
