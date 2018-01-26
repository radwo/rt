class Task < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 500 }
end
