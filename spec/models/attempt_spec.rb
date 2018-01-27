require 'rails_helper'

RSpec.describe Attempt, type: :model do
  it { should belong_to(:task) }

  it { should validate_presence_of(:code) }
  it { should validate_length_of(:code).is_at_most(1500) }
end
