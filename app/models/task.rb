class Task < ApplicationRecord
  validates :name, uniqueness: true
end
