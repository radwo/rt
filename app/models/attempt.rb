class Attempt < ApplicationRecord
  validates :code, presence: true, length: { maximum: 1500 }

  belongs_to :task, inverse_of: :attempts
end
