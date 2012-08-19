namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    admin = User.create!(name: "duende84",
                 email: "andreselduende@gmail.com",
                 password: "andres44*",
                 password_confirmation: "andres44*")
    admin.toggle!(:admin)
    
    admin2 = User.create!(name: "ana",
                 email: "nnysa16@hotmail.com",
                 password: "ana123",
                 password_confirmation: "ana123")
    admin2.toggle!(:admin)
    
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end