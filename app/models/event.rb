# Class Event
class Event < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 450, minimum: 2 }
  validates :name, presence: true
  validates :name, length: { maximum: 200, minimum: 2 }
end
