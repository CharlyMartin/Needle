###########################################################
# CREATING A DESIGNER

User.destroy_all
puts "destroying users (and linked tables)"

designer = User.new(
  first_name: "Yves",
  last_name: "Saint-Laurent",
  address: "3, Rue Léonce Reynaud 75000 Paris",
  date_of_birth: "1936-08-01",
  gender: "male",
  email: "ysl@needle.com",
  password: "jesuisyves"
)
puts "new designer"

designer.save
puts "saving designer"


###########################################################
# CREATING ON-GOING CAMPAINGS FOR THE DESIGNER

5.times do
  Campaign.create(
    title: Faker::Book.title,
    batch_size: [100, 110, 150, 180, 200, 210, 250, 300].sample,
    date_start: Faker::Date.between(15.days.ago, Date.today),
    date_end: Faker::Date.forward(15),
    description: Faker::Lorem.sentences(1),
    spec: Faker::Lorem.paragraph(2),
    price: rand(80...500),
    category: ["denim", "dress", "shoes", "top", "coat"].sample,
    gender: ["man", "woman", "unisex"].sample,
    status: ["submitted", "pending", "accepted", "rejected"].sample,
    user: User.last
  )
  puts "creating a campaign"
end

###########################################################
# CREATING ON-GOING CAMPAINGS FOR THE DESIGNER

5.times do
  Campaign.create(
    title: Faker::Book.title,
    batch_size: [100, 110, 150, 180, 200, 210, 250, 300].sample,
    date_start: Faker::Date.between(150.days.ago, 100.days.ago),
    date_end: Faker::Date.between(75.days.ago, 50.days.ago),
    description: Faker::Lorem.sentences(1),
    spec: Faker::Lorem.paragraph(2),
    price: rand(80...500),
    category: ["denim", "dress", "shoes", "top", "coat"].sample,
    gender: ["man", "woman", "unisex"].sample,
    status: ["submitted", "pending", "accepted", "rejected"].sample,
    user: User.last
  )
  puts "creating a campaign"
end


