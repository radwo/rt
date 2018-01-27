require 'rails_helper'

RSpec.describe CodeBuilder do
  let(:code) { 'code' }
  let(:input) { 'input' }
  let(:template) { "fooo\n__CODE__\nbarr\__INPUT__" }

  it 'should join code and input into template' do
    result = CodeBuilder.new.(code, input, template)
    expect(result).to eq("fooo\ncode\nbarr\input")
  end
end
