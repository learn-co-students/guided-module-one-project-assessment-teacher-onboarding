require_relative '../config/environment'
require_relative '../lib/cli'
require_relative '../lib/label_generator'
require "pry"

cli = CommandLineInterface.new

cli.greet
choice = cli.options

case choice
when 1
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
  user_existing = cli.choose_existing_label
  current_user.labels << user_existing
  cli.creating_profile

  host_suggestions = cli.host_suggestion(current_user)
  host_choice = cli.choose_host(host_suggestions)
  current_user.host = host_choice
  cli.host_confirmation(host_choice)

  guest_suggestions = cli.guest_suggestion(current_user)

  cli.final_confirmation
when 2

when 3
  
when 4
  
end
