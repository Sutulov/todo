# frozen_string_literal: true

namespace(:events) do
  desc('Список пользователей (User) в алфавитном порядке (по полю name)')
  task stats: :environment do
    User.order(:name).pluck(:name, :id).to_h.each do |k, v|
      print "User: #{k} - "
      print "events = #{Event.where(user_id: v).select(:user_id).count}, items = "
      puts Event.where(user_id: v).select(:id).pluck(:id).reduce(0) { |sum, i|
        sum + Item.where(event_id: i).select(:event_id).count
      }
    end
  end
end
