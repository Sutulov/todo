# frozen_string_literal: true

# Class Role
class Role < ApplicationRecord
  validates :name, :code, presence: true

  has_many :users
end
