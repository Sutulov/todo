# frozen_string_literal: true

namespace :events do
  desc 'Список пользователей (User) в алфавитном порядке (по полю name)'
  task stats: :environment do
    User.order(:name).pluck(:name, :id).to_h.each do |k, v|
      print "User: #{k} - "
      print "events = #{Event.where(user_id: v).select(:user_id).count}, items = "
      puts Item.where(event_id: Event.where(user_id: v).pluck(:id)).count
    end
  end
end
