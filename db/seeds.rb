20.times{
  new_user = User.create(name: Faker::Name.name) 
  new_user.labels << Label.create(name: Faker::Creature::Animal.name)
  new_user.labels << Label.create(name: Faker::Superhero.power.downcase)
  new_user.labels << Label.create(name: Faker::Color.color_name.downcase)
  new_user.labels << Label.create(name: Faker::Food.dish.downcase) 
}

4.times{ 
  new_location = Location.create(name: Faker::Restaurant.name)
  new_host = Host.create(name: Faker::Artist.name, location: new_location) 
  10.times{ new_host.labels << Label.all[rand(0...Label.all.length)]}
}

User.all.each do |user|
  Host.all[rand(0...Host.all.length)].users << user
  user.labels << Label.all[rand(0...Label.all.length)]
end
