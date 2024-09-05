require 'faker'

password_users = "123456"
User.destroy_all
Book.destroy_all

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: password_users
  )
end

genres = ['Drama', 'Terror', 'Suspense', 'Novel', 'Poetry']

genres.each do |g|
  30.times do
    Book.create!(
      title: Faker::Book.title,
      author: Faker::Book.author,
      genre: g,
      synopsis: Faker::Lorem.paragraph(sentence_count: 5),
      available_quantity: rand(1..20),
      price: rand(10.0..50.0).round(2)
    )
  end
end
