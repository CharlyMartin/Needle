###########################################################
# CREATING A DESIGNER(Ysl) WHO HAS 3 CAMPAIGNS AND A USER(Felix) WITH 2 CAMPAIGNS

User.destroy_all
Campaign.destroy_all

puts "destroying users (and linked tables)"

Ysl = User.new(
  first_name: "Yves",
  last_name: "Saint-Laurent",
  address: "3, Rue Léonce Reynaud 75000 Paris",
  date_of_birth: "1936-08-01",
  gender: "male",
  email: "ysl@needle.com",
  password: "jesuisyves"
)
puts "new designer"

Ysl.save
puts "saving designer"

Felix = User.new(
  first_name: "Felix",
  last_name: "Bungener",
  address: "Place de la bourse, 33000 Bordeaux",
  date_of_birth: "1994-12-17",
  gender: "male",
  email: "fbungener@needle.com",
  password: "jesuisfelix"
)
puts "new designer"

Felix.save
puts "saving designer"



###########################################################
# CREATING 1 ON-GOING CAMPAING FOR THE DESIGNER Ysl

Campaign.create(
  title: "Bag-Awesomeness",
  batch_size: 150,
  date_start: Date.today - 4,
  date_end: Date.today + 6,
  duration: 10,
  description: "By far, one of the most interresting project I had to work on, lots of different materials and cuts. ",
  spec: "Fabric outer/Twin handles/Zip top closure/Interior slip pocket/Wipe with a damp cloth/100% Nylon/H: 39cm/15' W: 54cm/21' D: 22cm/9",
  price: 90,
  category: "Bag",
  gender: "Both",
  photo_url: "http://images.asos-media.com/inv/media/0/1/7/5/6275710/black/image1xxl.jpg",
  status_public: "active",
  user: Ysl
  )

  puts "creating a campaign"

###########################################################
# CREATING 2 PAST CAMPAINGS FOR THE DESIGNER Ysl

Campaign.create(
  title: "The ultimate blouse",
  batch_size: 250,
  date_start: Date.today - 15,
  date_end: Date.today - 5,
  duration: 10,
  description: "Classy Go To shirt thought for outdoor livin",
  spec: "Woven fabric/High ruffle neckline/Button placket/Floral print detail",
  price: 45,
  category: "Shirt",
  gender: "Women",
  photo_url: "http://images.asos-media.com/inv/media/7/9/7/1/6911797/ivory/image1xxl.jpg",
  status_public: "successful",
  user: Ysl
  )

Campaign.create(
  title: "Hipster-T",
  batch_size: 250,
  date_start: Date.today - 25,
  date_end: Date.today - 5,
  duration: 20,
  description: "Fabulous t-shirt with a trendy cut for every office day",
  spec: "Lightweight jersey/Oil wash/Crew neck/Dropped shoulders/100cotton",
  price: 60,
  category: "T-shirt",
  gender: "Men",
  photo_url: "http://images.asos-media.com/inv/media/8/5/0/5/6465058/rustwhite/image1xxl.jpg",
  status_public: "failed",
  user: Ysl
  )

  puts "creating a campaign"

###########################################################
# CREATING 2 CAMPAING FOR Felix
#
Campaign.create(
  title: "Be tie",
  batch_size: 300,
  duration: 20,
  description: "Office is your kingdom, style your business",
  spec: "Lightweight silky jersey/Dropped tie/100silk",
  price: 35,
  category: "Tie",
  gender: "Men",
  photo_url: "http://images.asos-media.com/inv/media/8/8/7/7/6457788/navy/image1xxl.jpg",
  status_private: "accepted",
  user: Felix
  )
Campaign.create(
  title: "Night Grooving",
  batch_size: 150,
  duration: 30,
  description: "Lets dance tonight with theses crazy shoes, built to resist to evry single step on the counter",
  spec: "Heavy leather with jersey/Handmade craft/Iron",
  price: 250,
  category: "Shoes",
  gender: "Men",
  photo_url: "http://designerswap.ca/wp-content/uploads/2015/11/stitching.jpg",
  status_private: "pending",
  user: Felix
  )
  puts "creating a campaign"

#orders a faire et campagne a nous




