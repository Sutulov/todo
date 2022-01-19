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

  after_create :count_events
  after_destroy :recount_events

  private

  def count_events
    user.increment!(done? ? :events_done_count : :events_not_done_count)
  end

  def recount_events
    user.decrement!(done? ? :events_done_count : :events_not_done_count)
  end
end
