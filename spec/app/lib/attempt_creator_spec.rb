require 'rails_helper'

RSpec.describe AttemptCreator do
  it 'should create attempt and perform workers for valid attributes' do
    task = FactoryBot.create(:task_with_solutions)
    attributes = { code: 'foo', task_id: task.id }

    status = nil
    expect {
      status, _ = AttemptCreator.new(attributes).call
    }.to change(RunnerWorker.jobs, :size).by(3)

    expect(status).to eq(true)
  end

  it 'should not create attempt or perform workers for invalid attributes' do
    task = FactoryBot.create(:task_with_solutions)
    attributes = { code: '', task_id: task.id }

    status = nil
    expect {
      status, _ = AttemptCreator.new(attributes).call
    }.to change(RunnerWorker.jobs, :size).by(0)

    expect(status).to eq(false)
  end
end
