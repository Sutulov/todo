# frozen_string_literal: true

# Class Event
class Event < ApplicationRecord
  validates :content, :name, presence: true
  validates :content, length: { maximum: 450, minimum: 2 }
  validates :name, length: { maximum: 200, minimum: 2 }

  belongs_to :user, counter_cache: true
  has_many :items, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user
end
