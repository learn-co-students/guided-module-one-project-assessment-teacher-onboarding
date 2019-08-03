require_relative '../config/environment'
require_relative '../lib/cli'
require_relative '../lib/label_generator'
require "pry"

cli = CommandLineInterface.new

cli.greet
user_name = cli.set_user_name
current_user = User.create(name: user_name)
user_animal = cli.choose_animal_label
current_user.labels << user_animal
user_power = cli.choose_power_label
current_user.labels << user_power
user_color = cli.choose_color_label
current_user.labels << user_color
user_food = cli.choose_food_label
current_user.labels << user_food
puts "Thank you!"