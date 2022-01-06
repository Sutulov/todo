# frozen_string_literal: true

# Class User
class User < ApplicationRecord
  before_destroy :log_before_destroy
  after_destroy :log_after_destroy

  validates :email, :name, presence: true
  validates :email, :name, uniqueness: true
  validates :name, length: { maximum: 25, minimum: 2 }

  store_accessor :settings, :per_page, :time_zone, :show_help
  store :settings, coder: JSON
  enum state: %i[created email_verified studied actived disabled]

  scope :default, -> { where(role_id: Role.find_by(code: :default).id) }
  scope :fresh, ->(created_at) { where('created_at > ?', created_at) }
  scope :default_fresh, ->(created_at) { default.fresh(created_at) }

  belongs_to :role
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_events, through: :comments, source: :commentable, source_type: :Event
  has_many :commented_users, through: :comments, source: :commentable, source_type: :User
  has_many :all_my_items, through: :events, source: :items

  def log_before_destroy
    Rails.logger.info "######################################"
    Rails.logger.info "Собираемся удалить пользователя #{name}"
    Rails.logger.info "######################################"
  end

  def log_after_destroy
    Rails.logger.info "######################################"
    Rails.logger.info "Пользователь #{name} удалён"
    Rails.logger.info "######################################"
  end
end
