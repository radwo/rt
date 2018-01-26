require 'rails_helper'

RSpec.describe Solution, type: :model do
  it { should belong_to(:task) }

  it { should validate_presence_of(:input) }
  it { should validate_length_of(:input).is_at_most(255) }

  it { should validate_presence_of(:output) }
  it { should validate_length_of(:output).is_at_most(255) }
end
