# Class Item
class Item < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 10, minimum: 2 }
end
