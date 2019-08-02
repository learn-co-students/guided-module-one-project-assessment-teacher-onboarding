10.times{ User.create(name: Faker::Name.name) }
10.times{ Host.create(name: Faker::Artist.name) }
10.times{ Location.create(name: Faker::Restaurant.name) }
10.times{ Label.create(name: Faker::Creature::Animal.name) }