# frozen_string_literal: true

Event.destroy_all
User.destroy_all

hash_users = 10.times.map do
  {
    email: FFaker::Internet.safe_email,
    name: FFaker::Internet.user_name
  }
end

users = User.create hash_users

hash_events = 20.times.map do
  {
    name: FFaker::Lorem.phrase,
    content: FFaker::Lorem.paragraph,
    user_id: users.sample.id
  }
end

Event.create hash_events
