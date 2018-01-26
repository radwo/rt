class Task < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 500 }

  has_many :solutions, inverse_of: :task, dependent: :delete_all

  accepts_nested_attributes_for :solutions, reject_if: :all_blank, allow_destroy: true
end
