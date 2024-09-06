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
images_url = [
  "https://m.media-amazon.com/images/I/61BI029cgfL._SL1360_.jpg",
  "https://gandhi.vtexassets.com/arquivos/ids/1789581…8533945875600000&width=300&height=300&aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/3725441…8385783947430000&width=300&height=300&aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/4209131…8471000466300000&width=300&height=300&aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/3015493/85e71c1b-dfdb-461f-a6f9-7114a238537f.jpg?v=638384764445070000",
  "https://gandhi.vtexassets.com/arquivos/ids/3691291/e23b815d-fcd6-4ecb-9c8d-dfc6419ebbba.jpg?v=638385735649370000,",
  "https://gandhi.vtexassets.com/arquivos/ids/2265185-800-auto?v=638573931637330000&width=800&height=auto&      aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/4424266/image.jpg?v=638472477754430000",
  "https://gandhi.vtexassets.com/arquivos/ids/2464956-800-auto?v=638429949035430000&width=800&height=auto&aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/4581791-800-auto?v=638554486862800000&width=800&height=auto&aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/925299-300-300?v=638336796207670000&width=300&height=300&aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/3210341-300-300?v=638385035103900000&width=300&height=300&aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/4206902-300-300?v=638446501272600000&width=300&height=300&aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/4424225-800-auto?v=638472474136200000&width=800&height=auto&aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/2028395/4a15f92c-9867-45df-a35a-962f08333f8c.jpg?v=638345379827670000",
  "https://gandhi.vtexassets.com/arquivos/ids/4557377-800-auto?v=638576800857500000&amp;width=800&amp;height=auto&amp;aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/4446323-300-300?v=638503497635800000&amp;width=300&amp;height=300&amp;aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/4149173-300-300?v=638551185095500000&amp;width=300&amp;height=300&amp;aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/4149173-300-300?v=638551185095500000&amp;width=300&amp;height=300&amp;aspect=true",
  "https://gandhi.vtexassets.com/arquivos/ids/4614852-800-auto?v=638574589263170000&amp;width=800&amp;height=auto&amp;aspect=true"
]

genres.each do |g|
  30.times do
    Book.create!(
      title: Faker::Book.title,
      img_url: images_url.sample,
      author: Faker::Book.author,
      genre: g,
      synopsis: Faker::Lorem.paragraph(sentence_count: 5),
      available_quantity: rand(1..20),
      price: rand(10.0..50.0).round(2)
    )
  end
end
