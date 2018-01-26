class Solution < ApplicationRecord
  belongs_to :task, inverse_of: :solutions

  validates :input, presence: true, length: { maximum: 255 }
  validates :output, presence: true, length: { maximum: 255 }
end
