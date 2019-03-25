User.create!(name:  "Le Quoc Cuong",
             email: "lqcuong.qt@gmail.com",
             password: "CTP971204",
             password_confirmation: "CTP971204",
             role: 1,
             activated: true,
             activated_at: Time.zone.now)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
Category.create(name: "Sach Hay")
Category.create(name: "Sach Khoa Hoc")
Category.create(name: "Sach Giao Khoa")
