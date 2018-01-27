class Task < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 1500 }
  validates :template, presence: true, length: { maximum: 1500 }

  has_many :solutions, inverse_of: :task, dependent: :delete_all
  has_many :attempts, inverse_of: :task, dependent: :restrict_with_error

  accepts_nested_attributes_for :solutions, reject_if: :all_blank, allow_destroy: true
end
