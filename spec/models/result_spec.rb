require 'rails_helper'

RSpec.describe Result, type: :model do
  it { should belong_to(:attempt) }

  context 'ongoig result' do
    let(:result) { FactoryBot.build(:result) }
    it 'should not be succes' do
      expect(result).not_to be_succes
    end
    it 'should not be failure' do
      expect(result).not_to be_failure
    end
    it 'should be running' do
      expect(result).to be_running
    end
  end

  context 'done result' do
    let(:result) { FactoryBot.build(:result_done) }
    it 'should be succes' do
      expect(result).to be_succes
    end
    it 'should not be failure' do
      expect(result).not_to be_failure
    end
    it 'should not be running' do
      expect(result).not_to be_running
    end
  end

  context 'result with invalid output' do
    let(:result) { FactoryBot.build(:result_with_invalid_output) }
    it 'should not be succes' do
      expect(result).not_to be_succes
    end
    it 'should be failure' do
      expect(result).to be_failure
    end
    it 'should not be running' do
      expect(result).not_to be_running
    end
  end

  context 'result not done' do
    let(:result) { FactoryBot.build(:result_not_done) }
    it 'should not be succes' do
      expect(result).not_to be_succes
    end
    it 'should be failure' do
      expect(result).to be_failure
    end
    it 'should not be running' do
      expect(result).not_to be_running
    end
  end
end
