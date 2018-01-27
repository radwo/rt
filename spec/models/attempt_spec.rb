require 'rails_helper'

RSpec.describe Attempt, type: :model do
  it { should belong_to(:task) }
  it { should have_many(:results) }

  it { should validate_presence_of(:code) }
  it { should validate_length_of(:code).is_at_most(1500) }

  context 'status' do
    it 'should change depending on the results' do
      attempt = FactoryBot.build(:attempt)
      attempt.results << FactoryBot.build(:result_done, attempt: attempt)
      expect(attempt.status).to eq('succes')
      attempt.results << FactoryBot.build(:result, attempt: attempt)
      expect(attempt.status).to eq('running')
      attempt.results << FactoryBot.build(:result_not_done, attempt: attempt)
      expect(attempt.status).to eq('failure')
    end
  end
end
