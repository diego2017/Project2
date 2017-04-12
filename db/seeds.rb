# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Welcome to the seed script :)"

User.destroy_all
Category.destroy_all
Product.destroy_all
ShoppingList.destroy_all
ListItem.destroy_all

# Users
u1 = User.create(email: "test@wdi.com", password: "cake", name: "Test")
u1 = User.create(email: "peach@wdi.com", password: "cake", name: "Peach")
u2 = User.create(email: "diego@wdi.com", password: "cake", name: "Diego")
u3 = User.create(email: "luke@wdi.com", password: "cake", name: "Luke")
u4 = User.create(email: "xander@wdi.com", password: "cake", name: "Xander")
u5 = User.create(email: "jin@wdi.com", password: "cake", name: "Jin")
u6 = User.create(email: "hen@wdi.com", password: "cake", name: "Hen")
u7 = User.create(email: "petr@wdi.com", password: "cake", name: "Petr")
u8 = User.create(email: "jared@wdi.com", password: "cake", name: "Jared")
u9 = User.create(email: "kevin@wdi.com", password: "cake", name: "Kevin")
u10 = User.create(email: "olivia@wdi.com", password: "cake", name: "Olivia")
u11 = User.create(email: "hayley@wdi.com", password: "cake", name: "Hayley")

# Categories
c1 = Category.create(name: "Perfumes")
c2 = Category.create(name: "Books")
c3 = Category.create(name: "Toys")
c4 = Category.create(name: "Technology")

# Perfumes
p1 = Product.create(name: "Marc Jacobs Honey EDP", price: 84.50 , description: "Sunny, delicious, floral! Happy and energenic with a touch of the unexpected", img_src: "pic1.jpg", category: c1)
p2 = Product.create(name: "SHISEIDO, Zen For Men", price: 128.00 , description: "The power of spicy woods layered with exotic fruits and masculine musk for an uncompromised sensuality and modern sophistication", img_src: "pic2.jpg", category: c1)
p3 = Product.create(name: "RALPH LAUREN, Polo Red Intense", price: 46.99, description: "POLO RED INTENSE captures speed, adrenaline and power in their most intense forms. An oriental spicy eau de parfum fragrance, POLO RED INTENSE introduces three new RED ingredients to the fiery fresh Polo Red mix", img_src: "pic3.jpg", category: c1)
p4 = Product.create(name: "DKNY, Be Delicious", price: 29.90, description: "Introducing Be Delicious Juiced! Bursting with a medley of fresh fruits, New York apples take center stage, complimented by a dose of pear blossom and golden mango nector.", img_src: "pic4.jpg", category: c1)
p5 = Product.create(name: "ISSEY MIYAKE, L'Eau D'Issey", price: 136.00 , description: "L'Eau d'Issey is the timeless fragrance by Issey Miyake, touched with pure freshness and feminity.", img_src: "pic5.jpg", category: c1)
p6 = Product.create(name: "VERSACE, Yellow Diamond", price: 70.00, description: "Versace Yellow Diamond is the new luxury fragrance by Versace. Pure as the sunlight, an extraordinary bright hue that radiates with a fiery intensity, sparkling the way that only a diamond can. Notes of citron, pear sorbet, orange blossom, and ambery woods", img_src: "pic6.jpg", category: c1)
p7 = Product.create(name: "CALVIN KLEIN, Encounter", price: 55.50, description: "ENCOUNTER Calvin Klein is an addictive blend of crisp spice, warm cognac and sensual woods. A contrast of freshness and warmth makes the men's fragrance a new, distinctive expression of unapologetic masculinity", img_src: "pic7.jpg", category: c1)
p8 = Product.create(name: "PRADA, Luna Rossa", price: 93.40 , description: "Prada's Luna Rossa EDT fragrance is a masculine scent, which prides itself on its innovative invigoration. The sleek excellence of the bottle and packaging take their inspiration from the acclaimed Luna Rossa sailing vessel. The magic of this must-have fragrance lies in its uncanny ability to blend a mixture of traditional ingredients and elements with something new, fresh and thoroughly unique. This is a perfect gift for the special man in your life and is sure to go down a delightful storm this Christmas.", img_src: "pic8.jpg", category: c1)
p9 = Product.create(name: "GIORGIO ARMANI, Eau de Nuit", price: 115.00 , description: "A new fragrance for men. A smart interpretation of the heart of the Italian night. It blends freshness and sensuality through a combination of Italian bergamot, Brazilian tonka bean, and tobacco.", img_src: "pic9.jpg", category: c1)
p10 = Product.create(name: "CLINIQUE, Happy Heart Perfume Spray", price: 115.00, description: "Clinique Happy Heart. A wealth of flowers. A hint of warmth. A deepening of emotions. A fragrance that captures the heart of the floral notes of Clinique Happy, but with a twist.", img_src: "pic10.jpg", category: c1)

# Books
p11 = Product.create(name: "Thinking, Fast and Slow", price: 39.90, description: "Two systems drive the way we think and make choices, Daniel Kahneman explains: System One is fast, intuitive, and emotional; System Two is slower, more deliberative, and more logical", img_src: "pic11.jpg", category: c2)
p12 = Product.create(name: "HARRY POTTER AND THE PHILOSOPHER'S STONE", price: 10.50, description: "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. ", img_src: "pic12.jpg", category: c2)
p13 = Product.create(name: "THE ALCHEMIST", price: 12.40, description: "Paulo Coelho's masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure.", img_src: "pic13.jpg", category: c2)
p14 = Product.create(name: "MOBY DICK", price: 5.50, description: "Call me Ishmael. These three famous words begin one of America’s most epic novels, a tale of one obsessed captain, his doomed crew, and an elusive white whale named Moby-Dick", img_src: "pic14.jpg", category: c2)
p15 = Product.create(name: "THE HOBBIT", price: 9.90, description: "The Hobbit is the unforgettable story of Bilbo, a peace-loving hobbit, who embarks on a strange and magical adventure", img_src: "pic15.jpg", category: c2)
p16 = Product.create(name: "THE LORD OF THE RINGS", price: 23.00, description: "In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others", img_src: "pic16.jpg", category: c2)
p17 = Product.create(name: "ROBIN HOOD", price: 34.50, description: "Based on the Paul Creswick telling of Robin Hood, and drawing from the rich and varied lore surrounding the beloved outlaw, this spirited reworking of Robin Hood's many adventures is a vibrant introduction to Friar Tuck, Little John, Maid Marian, the Sheriff of Nottingham, and, of course, Robin Hood", img_src: "pic17.jpg", category: c2)
p18 = Product.create(name: "MATHEMATICS, A complete introduction", price: 24.60, description: "Maths does not have to be difficult. This book, complete with exercises and answers, forms a course which will take you from beginner or intermediate level to being a confident mathematician.", img_src: "pic18.jpg", category: c2)
p19 = Product.create(name: "Spanish All-in-One for Dummies", price: 21.00, description: "Your comprehensive guide to speaking, reading, and writing in Spanish!
Want to speak Spanish? Looking to improve your Spanish skills? ", img_src: "pic19.jpg", category: c2)
p20 = Product.create(name: "GORDON RAMSAY'S HOME COOKING", price: 30.50, description: "Based on a new cooking show, this book will give experienced as well as novice cooks the desire, confidence and inspiration to get cooking.", img_src: "pic20.jpg", category: c2)

# Toys
p21 = Product.create(name: "BARBIE, Dreamtopia Bubble Fairy ", price: 23.55 , description: "These Bubble Fairy Barbie dolls have wings that are extra magical: they're butterfly-shaped and can make bubbles! ", img_src: "pic21.jpg", category: c3)
p22 = Product.create(name: "FURBY, Purple", price: 199.99, description: "This Furby Connect friend has a light-up antenna that glows when there's something new to discover in the app -- including music and videos. This Furby Connect friend has lots to say, even when Furby speaks in Furbish, it's not hard to figure out what Furby means. ", img_src: "pic22.jpg", category: c3)
p23 = Product.create(name: "FISHER-PRICE, Touch N Crawl Lion", price: 59.90, description: "Ready, set, crawl! This adorable plush first friend for baby is roaring to go, go, go! Babys gentle touch sets lion in motion moving back and forth & side to side with lively music that encourages baby to crawl along, too!", img_src: "pic23.jpg", category: c3)
p24 = Product.create(name: "PEPPA PIG", price: 34.90, description: "It's time for a new adventure for Peppa as she gets to experience all the excitement of going on holiday with these new additions to the popular Peppa Pig range.", img_src: "pic24.jpg", category: c3)
p25 = Product.create(name: "THOMAS THE TANK", price: 15.00, description: "Ashima is usually found working on the Nilgiri Mountain Railway in Southern India, where the steep incline makes the track very dangerous and difficult to climb - but she's never afraid. ", img_src: "pic25.jpg", category: c3)
p26 = Product.create(name: "HOT WHEELS", price: 34.00, description: "A ghostly pirate ship has raided the Monster Jam arena. Blast the cannon and fire the Captains Curse Monster Jam truck over the monstrous lagoon. ", img_src: "pic26.jpg", category: c3)
p27 = Product.create(name: "SPIDER-MAN", price: 38.75, description: "Once inside the jumpsuit, the padding and extra muscle will look and feel as if they are your own", img_src: "pic27.jpg", category: c3)
p28 = Product.create(name: "MONOPOLY Junior", price: 23.90, description: "Big kids don't have to have all the fun! Themed with a fun amusement park setting, the HASBRO Monopoly Junior will get little ones setting up ticket booths on different rides to collect money from other players. A thrilling ride, this game also has exciting chance cards with opportunities to win a free ticket booth, ride the railroad or hop on the rollercoaster! The player with the most cash wins", img_src: "pic28.jpg", category: c3)
p29 = Product.create(name: "PICTIONARY", price: 12.50, description: "Let your imagination run wild and your pencil will follow! It doesn't matter if you can draw the Mona Lisa or just stick figures, the excitement begins when everybody tries to shout ou the right answer", img_src: "pic29.jpg", category: c3)
p30 = Product.create(name: "LEGO, Batman", price: 15.00, description: "In the irreverent spirit of fun that made The LEGO Movie a worldwide phenomenon, the self-described leading man of that ensemble  LEGO Batman  stars in his own big-screen adventure: The LEGO Batman Movie. But there are big changes brewing in Gotham, and if he wants to save the city from The Jokers hostile takeover, Batman may have to drop the lone vigilante thing, try to work with others", img_src: "pic30.jpg", category: c3)

# Technology
p31 = Product.create(name: "SAMSUNG, Galaxy tab", price: 449.90 , description: "Love to watch? Download or stream your favourite movies, shows and games with a Full High Definition^ widescreen display. And to make viewing even better, the anti-glare feature automatically adjusts the screen brightness in low-light to help improve your viewing experience", img_src: "pic31.jpg", category: c4)
p32 = Product.create(name: "HP Pavilion ", price: 1250.40, description: "Prepared to be inspired. Whatever you're passionate about, get ready to take it to the next level with the all-new HP Pavilion Laptop. It's packed with the features you need to spark creativity, with a style all its own", img_src: "pic32.jpg", category: c4)
p33 = Product.create(name: "PANASONIC phone", price: 49.90, description: "When the area around the other party is noisy and it is difficult to hear, you can reduce the surrounding noise to make the speakers voice easier to hear just by pressing the dedicated button", img_src: "pic33.jpg", category: c4)
p34 = Product.create(name: "LOGITECH Wireless Mouse", price: 20.00, description: "The feel-good, reliable mouse, that'll make you forget the touchpad", img_src: "pic34.jpg", category: c4)
p35 = Product.create(name: "SONOS Boost", price: 149, description: "In most cases your Sonos system runs perfectly off the strength of your home wireless network.  However if your home has WiFI challenges, then BOOST is the product for you. BOOST offers comparable wireless broadcast power to expensive enterprise-grade WiFi routers that are typically found in large offices and corporate campuses", img_src: "pic35.jpg", category: c4)
p36 = Product.create(name: "SMARTOOOLS, Powerbank", price: 89.95, description: "roduct Features Portable mobile charger with 10000mAh Lithium-ion battery Smart 2.1A fast output Safe automatic detection protects against overheating and shortcircuit. 4-LED battery indicator comes 50% pre-charged in the box Brilliant varnish and high-quality heat printing Includes USB to Micro USB cable Compatible with all type Smartphones and Tablets thanks to the 2.1A of output power. Product Dimensions : 93 x 63 x 19 mm Available in assorted designs", img_src: "pic36.jpg", category: c4)
p37 = Product.create(name: "FITBIT", price: 350.90, description: "Dont just start. Surge with run time, distance, pace and elevation stats on display. See your routes as you run them, then scroll through workout summaries and split charts to stay on track while you train.", img_src: "pic37.jpg", category: c4)
p38 = Product.create(name: "PARROT, Mini Drone", price: 168.00, description: "Jump and roll anywhere! Parrot Jumping Sumo is a responsive robot with strong personality which rolls,
rushes, zigzags, circles, takes turns at 90 and which, in a flash, jumps up to 80cm in height and length!", img_src: "pic38.jpg", category: c4)
p39 = Product.create(name: "SPHERO", price: 220.00, description: "Over the years, the magic of Star Wars has always lived on screen and in our imaginations. Thanks to our advancements in technology, weve made it possible to bring a new part of Star Wars: The Force Awakens into your home", img_src: "pic39.jpg", category: c4)
p40 = Product.create(name: "LIFESTYLE OUTFITTERS", price: 99.00, description: "With this Bluetooth water-proof shower speaker you can stream your music wirelessly and answer calls hands-free!", img_src: "pic40.jpg", category: c4)


s1 = ShoppingList.create(name: "Mum", user: u1)
s2 = ShoppingList.create(name: "Dad", user: u1)
s3 = ShoppingList.create(name: "Brother", user: u1)
s4 = ShoppingList.create(name: "Lunch with friends", user: u2)
s5 = ShoppingList.create(name: "Christmas Party", user: u2)
s6 = ShoppingList.create(name: "Miriam's Bday", user: u3)
s7 = ShoppingList.create(name: "Dad's Bday", user: u3)
s8 = ShoppingList.create(name: "Brother's Graduation", user: u3)
s9 = ShoppingList.create(name: "Mum", user: u4 )
s10 = ShoppingList.create(name: "Dad", user: u4 )
s11 = ShoppingList.create(name: "Brother", user: u4 )
s12 = ShoppingList.create(name: "Housemate", user: u4 )
s13 = ShoppingList.create(name: "Kids", user: u5 )
s14 = ShoppingList.create(name: "May", user: u6 )
s15 = ShoppingList.create(name: "June", user: u6 )
s16 = ShoppingList.create(name: "Lunch with friends", user: u7 )
s17 = ShoppingList.create(name: "Work meeting", user: u7 )
s18 = ShoppingList.create(name: "For myself", user: u7 )
s19 = ShoppingList.create(name: "Rebecca", user: u8 )
s20 = ShoppingList.create(name: "Tom", user: u8 )
s21 = ShoppingList.create(name: "Mary", user: u8 )
s22 = ShoppingList.create(name: "Easter shopping", user: u9 )
s23 = ShoppingList.create(name: "For home", user: u10 )
s24 = ShoppingList.create(name: "Robert", user: u11 )
s25 = ShoppingList.create(name: "Melanie", user: u11 )


ListItem.create(shopping_list: s1, product: p1, quantity: rand(1..5))
ListItem.create(shopping_list: s1, product: p5, quantity: rand(1..5))
ListItem.create(shopping_list: s2, product: p40, quantity: rand(1..5))
ListItem.create(shopping_list: s3, product: p35, quantity: rand(1..5))
ListItem.create(shopping_list: s4, product: p23, quantity: rand(1..5))
ListItem.create(shopping_list: s5, product: p3, quantity: rand(1..5))
ListItem.create(shopping_list: s5, product: p14, quantity: rand(1..5))
ListItem.create(shopping_list: s6, product: p25, quantity: rand(1..5))
ListItem.create(shopping_list: s6, product: p37, quantity: rand(1..5))
ListItem.create(shopping_list: s6, product: p2, quantity: rand(1..5))
ListItem.create(shopping_list: s7, product: p9, quantity: rand(1..5))
ListItem.create(shopping_list: s7, product: p34, quantity: rand(1..5))
ListItem.create(shopping_list: s8, product: p21, quantity: rand(1..5))
ListItem.create(shopping_list: s9, product: p7, quantity: rand(1..5))
ListItem.create(shopping_list: s9, product: p18, quantity: rand(1..5))
ListItem.create(shopping_list: s9, product: p21, quantity: rand(1..5))
ListItem.create(shopping_list: s10, product: p6, quantity: rand(1..5))
ListItem.create(shopping_list: s10, product: p32, quantity: rand(1..5))
ListItem.create(shopping_list: s11, product: p33, quantity: rand(1..5))
ListItem.create(shopping_list: s11, product: p21, quantity: rand(1..5))
ListItem.create(shopping_list: s11, product: p16, quantity: rand(1..5))
ListItem.create(shopping_list: s12, product: p25, quantity: rand(1..5))
ListItem.create(shopping_list: s12, product: p3, quantity: rand(1..5))
ListItem.create(shopping_list: s12, product: p6, quantity: rand(1..5))
ListItem.create(shopping_list: s13, product: p23, quantity: rand(1..5))
ListItem.create(shopping_list: s13, product: p22, quantity: rand(1..5))
ListItem.create(shopping_list: s13, product: p15, quantity: rand(1..5))
ListItem.create(shopping_list: s14, product: p31, quantity: rand(1..5))
ListItem.create(shopping_list: s15, product: p15, quantity: rand(1..5))
ListItem.create(shopping_list: s15, product: p30, quantity: rand(1..5))
ListItem.create(shopping_list: s16, product: p12, quantity: rand(1..5))
ListItem.create(shopping_list: s17, product: p4, quantity: rand(1..5))
ListItem.create(shopping_list: s17, product: p2, quantity: rand(1..5))
ListItem.create(shopping_list: s18, product: p5, quantity: rand(1..5))
ListItem.create(shopping_list: s19, product: p2, quantity: rand(1..5))
ListItem.create(shopping_list: s19, product: p2, quantity: rand(1..5))
ListItem.create(shopping_list: s19, product: p33, quantity: rand(1..5))
ListItem.create(shopping_list: s20, product: p5, quantity: rand(1..5))
ListItem.create(shopping_list: s20, product: p25, quantity: rand(1..5))
ListItem.create(shopping_list: s21, product: p3, quantity: rand(1..5))
ListItem.create(shopping_list: s21, product: p8, quantity: rand(1..5))
ListItem.create(shopping_list: s21, product: p18, quantity: rand(1..5))
ListItem.create(shopping_list: s22, product: p38, quantity: rand(1..5))
ListItem.create(shopping_list: s22, product: p30, quantity: rand(1..5))
ListItem.create(shopping_list: s23, product: p22, quantity: rand(1..5))
ListItem.create(shopping_list: s24, product: p33, quantity: rand(1..5))
ListItem.create(shopping_list: s24, product: p1, quantity: rand(1..5))
ListItem.create(shopping_list: s25, product: p24, quantity: rand(1..5))
ListItem.create(shopping_list: s25, product: p25, quantity: rand(1..5))
ListItem.create(shopping_list: s14, product: p37, quantity: rand(1..5))




puts "The seed file worked :) :) :)"
