user_roles = %w[buyer seller]
password_users = "123456"
available_quantity = rand(1..10)
User.destroy_all
Book.destroy_all

5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: user_roles.sample,
    email: Faker::Internet.email,
    password: password_users
  )

  # Asignar libros solo a los usuarios vendedores
  if user.role == 'seller'
    5.times do
      Book.create(
        title: Faker::Book.title,
        author: Faker::Book.author,
        genre: Faker::Book.genre
        available_quantity: available_quantity
        user: user
      )
    end
  end
end
