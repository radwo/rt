require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should have_many(:solutions) }
  it { should have_many(:attempts) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(255) }
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_most(1500) }

  it { should validate_presence_of(:template) }
  it { should validate_length_of(:template).is_at_most(1500) }
end
