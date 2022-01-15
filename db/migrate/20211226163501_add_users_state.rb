# frozen_string_literal: true

# Class AddUsersState
class AddUsersState < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :state, :integer, comment: 'Статусная модель пользователя'
  end
end
