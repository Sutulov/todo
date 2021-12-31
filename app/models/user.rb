# frozen_string_literal: true

# Class User
class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 16, minimum: 2 }

  store_accessor :settings, :per_page, :time_zone, :show_help
  store :settings, coder: JSON
  enum state: %i[created email_verified studied actived disabled]

  scope :default, -> { where(role_id: Role.find_by(code: :default).id) }
  scope :fresh, ->(created_at) { where('created_at > ?', created_at) }
  scope :default_fresh, ->(created_at) { default.fresh(created_at) }

  belongs_to :role
  has_many :events
end
