# Class Event
class Event < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 100, minimum: 2 }
  validates :name, presence: true
  validates :name, length: { maximum: 10, minimum: 2 }
end
