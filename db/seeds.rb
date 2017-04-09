# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Start of seed script!"



products = [
  {
    name: "Perfume A",
    price: 12.99,
    description: "Description of Perfume A",
    img_src: "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2014/1/22/1390404430117/Vintage-perfume-bottle-008.jpg?w=700&q=55&auto=format&usm=12&fit=max&s=5431e2ec6d1bcdd4ab9448837673d55f"
  },
  {
    name: "Thinking, Fast and Slow: Daniel Kahneman",
    price: 16.27,
    description: "Thinking, Fast and Slow by Daniel Kahneman",
    img_src: "https://images-na.ssl-images-amazon.com/images/I/51oXKWrcYYL.jpg"
  }
]

products.each do |product|
  Product.create(name: product[:name], price: product[:price], description: product[:description], img_src: product[:img_src])
end

users = [
  {
    email: "customer@ga.com",
    password: "test",
    name: "customer",
    shopping_lists: [
      {
        name: "Chrismas Presents",
        list_items: [
          {
            # name: "Perfume for mom"
            product_id: Product.first.id,
            quantity: 2
          }
        ]
      }
    ]
  }
]

users.each do |user|
  new_user = User.new(name: user[:name], email: user[:email], password: user[:password])
  new_user.save
  user[:shopping_lists].each do |shopping_list|
    new_shopping_list = ShoppingList.create(name: shopping_list[:name], user_id: new_user.id)
    shopping_list[:list_items].each do |list_item|
      new_list_item = ListItem.create(product_id: list_item[:product_id], quantity: list_item[:quantity], shopping_list_id: new_shopping_list.id)
    end
  end
end

puts "End of seed script!"
