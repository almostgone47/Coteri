# Seed the database with with rake db:seed (or created alongside the db with db:setup).
# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.destroy_all

# Creates users with Faker with the defined password
password="hunter2"

100.times do |i|
	user = User.new(
    email:                 Faker::Internet.email,
    password:              password,
    password_confirmation: password
  )
  user.skip_confirmation!
  user.save!
end