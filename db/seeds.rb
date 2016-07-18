# Seed the database with with rake db:seed (or created alongside the db with db:setup).
# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 1 user
# user = User.new.tap do |u|
#   u.email = 'email@server.com'
#   u.password = 'hackme!'
#   u.password_confirmation = 'hackme!'
#   u.skip_confirmation!
#   u.save!
# end

# Creates users with Faker with the password 'password'
password="password"

User.populate 100 do |user|
  user.email = Faker::Internet.email
  user.encrypted_password = User.new(password :password).encrypted_password
end