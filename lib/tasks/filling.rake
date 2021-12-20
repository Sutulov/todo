desc 'Заполняет таблицы пользователей, ролей, дел и подпунктов тестовыми данными'
task filling: :environment do
  User.create name: FFaker::Name.name, email: FFaker::Internet.email
  Role.create name: FFaker::Lorem.word, code: FFaker::Lorem.word
  Event.create name: FFaker::Lorem.word, content: FFaker::Lorem.sentence, finished_at: FFaker::Time.date
  Item.create name: FFaker::Lorem.word, finished_at: FFaker::Time.date
end
