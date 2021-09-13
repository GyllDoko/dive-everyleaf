# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.create(name: "test_user", email: "text@example.com", is_admin: true, password: "password")
# tasks = Task.all

# tasks.each do |task|
#     task.update(user_id: User.last.id)
# end
status = ["unstarted", "progress", "completed"]
priority = ["Low", "Medium", "High"]

(1..10).each do |x|
    name = Faker::Lorem.word
    Label.create(name: name)
    User.create(name: "name#{x}", email: "example#{x}@gmail.com", password: "password")
    Task.create(name: "task_title#{x}", content: "content#{x}", expiry_date: Faker::Date.between(from: '2021-09-01', to: '2021-09-25'), status: status.sample, priority: priority.sample)
  
end
