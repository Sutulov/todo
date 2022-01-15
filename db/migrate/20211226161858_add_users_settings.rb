# frozen_string_literal: true

# Class AddUsersSettings
class AddUsersSettings < ActiveRecord::Migration[6.1]
  def change
    add_column :users,
               :settings,
               :jsonb,
               default: {},
               comment: 'Индивидуальные параметры пользователя'
  end
end
