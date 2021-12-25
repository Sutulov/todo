# frozen_string_literal: true

# Class Item
class Item < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 500, minimum: 2 }
end
