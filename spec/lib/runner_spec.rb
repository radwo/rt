require 'spec_helper'
require 'runner'

RSpec.describe Runner do

  context 'with valid C code' do
    let(:program_content) {
      File.read(File.expand_path('../fixtures/c/correct.c', __dir__))
    }
    it 'executes C code and returns output' do
      runner = Runner.new(program_content)
      runner.run
      loop do
        sleep 1
        break if runner.finished?
      end
      expect(runner).to be_succesed
      expect(runner.result).to eq("2")
    end
  end

  context 'with long running process' do
    let(:program_content) {
      File.read(File.expand_path('../fixtures/c/sleep.c', __dir__))
    }
    it 'can detect and abort too long execution' do
      runner = Runner.new(program_content)
      runner.run
      sleep 2
      expect(runner).not_to be_finished
      runner.abort
      expect(runner).to be_finished
      expect(runner).not_to be_succesed
      expect(runner.result).to eq("")
    end
  end

  context 'with invalid C code' do
    let(:program_content) {
      File.read(File.expand_path('../fixtures/c/empty.c', __dir__))
    }
    it 'returns error' do
      runner = Runner.new(program_content)
      runner.run
      loop do
        sleep 1
        break if runner.finished?
      end
      expect(runner).not_to be_succesed
      expect(runner.result).to include("error")
    end
  end
end
