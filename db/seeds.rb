require 'faker'


User.delete_all
Friend.delete_all
Tweet.delete_all

# 20.times do

#   u1 = User.new(name: Faker::Name.name , email: , password: )
#   u2 = Tweet.new(name: , email: , password: )
#   u1.save
#   u2.save
#   Friend.create(follower_id: u1.id, followee_id: u2.id)
# end

100.times do
  User.create(name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123"
    )
end

100.times do
  Tweet.create(body: Faker::Lorem.paragraph, user_id: rand(1..100))
end

100.times do
  Friend.create(
    followee_id: rand(1..100),
    follower_id: rand(1..100)
    )
end
