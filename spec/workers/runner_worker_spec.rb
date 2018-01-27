require 'rails_helper'

RSpec.describe RunnerWorker, type: :worker do
  runner_class = Class.new do
    def initialize(program)
      @program = program
    end

    def run; end

    def abort_if_too_long
      false
    end

    def finished?
      true
    end

    def result
      "#{@program} bar"
    end

    def succesed?
      true
    end
  end

  it 'should update result with output' do
    result = FactoryBot.create(:result)

    worker = RunnerWorker.new
    runner = double("runner_class")
    runner = double("runner")

    allow(worker).to receive(:runner_class) { runner_class }

    worker.perform(result.id, 'foo')

    result.reload

    expect(result.output).to eq('foo bar')
    expect(result.done).to eq(true)
  end
end
