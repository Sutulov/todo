namespace(:events) do
  desc('Список пользователей (User) в алфавитном порядке (по полю name)')
  task stats: :environment do
    puts User.order(:name).pluck(:name)
  end
end
