# frozen_string_literal: true

# Class Item
class Item < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 500, minimum: 2 }

  belongs_to :event
  has_one :user_items, through: :event, source: :user
end
