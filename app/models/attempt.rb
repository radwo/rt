class Attempt < ApplicationRecord
  validates :code, presence: true, length: { maximum: 1500 }

  belongs_to :task, inverse_of: :attempts
  has_many :results, inverse_of: :attempt, dependent: :delete_all

  def status
    case
    when results.any?(&:failure?)
      'failure'
    when results.any?(&:running?)
      'running'
    else
      'succes'
    end
  end
end
