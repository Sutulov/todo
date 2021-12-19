# Class Role
class Role < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 10, minimum: 2 }
  validates :code, presence: true
  validates :code, length: { maximum: 10, minimum: 2 }
end
