require_relative 'label_generator'

class CommandLineInterface
  def initialize
    @labgen = LabelGenerator.new
  end

  def greet
    puts "Welcome to Labels, an old way to meet new people!"
  end

  def options
    puts "Would you like to"
    puts "1. Make an account"
    puts "2. Check account status"
    puts "3. Delete an account"
    puts "4. Exit"
    choice = gets.chomp
    if choice[0] == "1" || choice[0].downcase == "m"
      choice = 1
    elsif choice[0] == "2" || choice[0].downcase == "c"
      choice = 2
      check_status
    elsif choice[0] == "3" || choice[0].downcase == "d"
      choice = 3
      delete_account
    elsif choice[0] == "4" || choice[0].downcase == "e"
      choice = 4
      puts "Bye for now!"
    else
      options
    end
    choice
  end

  def check_status
    puts "What's your name?"
    user_name = gets.chomp
    user = User.find_by(name: user_name)
    if user == nil
      puts "Your name wasn't found."
      options
    else
      puts "Welcome back #{user.name}!"
      if user.host == nil
        puts "You haven't chosen a host."
        host_suggestions = host_suggestion(user)
        host_choice = choose_host(host_suggestions)
        user.host = host_choice
        host_confirmation(host_choice)
      
        guest_suggestions = guest_suggestion(user)
      
        final_confirmation
      else
        puts "You're currently running with #{user.host} at the #{user.host.location}."
        guest_suggestion(user)
        puts "See you there!"
      end
    end
  end

  def delete_account
    puts "What's your name?"
    user_name = gets.chomp
    user = User.find_by(name: user_name)
    if user == nil
      puts "Your name wasn't found. Your account may have already been deleted!"
      options
    else
      puts "Are you sure you want to delete your account?"
      deletion_confirmation = gets.chomp
      if deletion_confirmation[0].downcase == "y"
        user.delete
        puts "We'll be here when you need us. Have fun in the world!"
      else
        puts "We're so glad to have your company!"
        options
      end
    end
  end

  def set_user_name
    puts "What's your name?"
    user_name = gets.chomp
    puts "Hey there, #{user_name}!"
    puts "To help us match you with a host, please select a few labels for yourself."
    user_name
  end

  def choose_animal_label   
    puts "Choose one of the following six animals:"

    animal_choices = @labgen.print_labels(@labgen.animals)

    user_animal = ""
    until user_animal != ""
      user_animal = gets.chomp.downcase
      if !animal_choices.include?(user_animal)
        user_animal = ""
        @labgen.populate_animals
        puts "Please choose one of the following six animals:"
        animal_choices = @labgen.print_labels(@labgen.animals)
      end
    end

    puts "#{user_animal.capitalize}! How majestic!"
    
    user_animal_label = Label.find_or_create_by(name: user_animal)
  end

  def choose_power_label   
    puts "Choose one of the following six powers:"

    power_choices = @labgen.print_labels(@labgen.powers)

    user_power = ""
    until user_power != ""
      user_power = gets.chomp.downcase
      # binding.pry
      if !power_choices.include?(user_power)
        user_power = ""
        @labgen.populate_powers
        puts "Please choose one of the following six powers:"
        power_choices = @labgen.print_labels(@labgen.powers)
      end
    end

    puts "#{user_power.capitalize}! Zounds!"

    user_power_label = Label.find_or_create_by(name: user_power)
  end

  def choose_color_label   
    puts "Choose one of the following six colors:"

    color_choices = @labgen.print_labels(@labgen.colors)

    user_color = ""
    until user_color != ""
      user_color = gets.chomp.downcase
      if !color_choices.include?(user_color)
        user_color = ""
        @labgen.populate_colors
        puts "Please choose one of the following six colors:"
        color_choices = @labgen.print_labels(@labgen.colors)
      end
    end

    puts "#{user_color.capitalize}. The perfect touch."
    
    user_color_label = Label.find_or_create_by(name: user_color)
  end

  def choose_food_label   
    puts "Choose one of the following six foods:"

    food_choices = @labgen.print_labels(@labgen.foods)

    user_food = ""
    until user_food != ""
      user_food = gets.chomp.downcase
      if !food_choices.include?(user_food)
        user_food = ""
        @labgen.populate_foods
        puts "Please choose one of the following six foods:"
        food_choices = @labgen.print_labels(@labgen.foods)
      end
    end

    puts "#{user_food.capitalize}... a dish befitting the finest."
    
    user_food_label = Label.find_or_create_by(name: user_food)
  end
  
  def choose_existing_label   
    puts "Choose one of the following six labels in your area:"

    existing_choices = @labgen.print_labels(@labgen.existing)

    user_existing = ""
    until user_existing != ""
      user_existing = gets.chomp.downcase
      if !existing_choices.include?(user_existing)
        user_existing = ""
        @labgen.populate_existings
        puts "Please choose one of the following six existings:"
        existing_choices = @labgen.print_labels(@labgen.existings)
      end
    end

    puts "#{user_existing.capitalize}? So you're one of those!"

    user_existing_label = Label.find_or_create_by(name: user_existing)
  end

  def creating_profile
    "Creating profile..."
  end

  def host_suggestion(current_user)
    host_matches = current_user.match_to_host
    puts "Based on your labels, might we suggest getting together with:"
    if host_matches.length == 0
      Host.all.each do |host|
        host_labels = host.labels.map { |label| label.name }
        print "#{host.name}, who revels in "
        if host_labels.length == 1
          puts "#{host_labels[0]}."
        elsif host_labels.length == 2
          puts "#{host_labels[0]} and #{host_labels[1]}."
        else
          puts host_labels[0..-2].join(", ") + ", and " + host_labels[-1] + "."
        end
      end
      return Host.all.map { |host| host.name }
    else
      host_matches.each do |match|
        match_labels = match[1].map do |label|
          label.name
        end
        print "#{match[0]}, who also shares your fondness for "
        if match_labels.length == 1
          puts "#{match_labels[0]}."
        elsif match_labels.length == 2
          puts "#{match_labels[0]} and #{match_labels[1]}."
        else
          puts match_labels[0..-2].join(", ") + ", and " + match_labels[-1] + "."
        end
      end
      return host_matches.map{ |host| host[0]}
    end
  end

  def choose_host(host_suggestions)
    # binding.pry
    puts "Which host are you interest in joining?"
    host_choice = ""
    until host_choice != ""
      host_choice = gets.chomp
      if !host_suggestions.include?(host_choice)
        host_choice = ""
        puts "Please choose one of the following hosts:"
        host_suggestions.each{ |suggestion| print "| #{suggestion} |" }
        puts ""
      end
    end
    # binding.pry
    host_choice = Host.find_by(name: host_choice)
  end

  def host_confirmation(host_choice)
    # binding.pry
    neighborhood_array = ["downtown", "uptown", "on the east side", "on the west side", "on the south side", "on the north side", "lakeside", "in the Phishing District", "in Little Moscow"]
    day_array = ["Sundays", "Mondays", "Tuesdays", "Wednesdays", "Thursdays", "Fridays", "Saturdays"]
    time_array = ["at 9 AM", "around noon thirty", "from 2 to 4 PM", "starting at 6 in the evening", "from 9 at night until whenever"]
    puts "You'll blossom in the aura of #{host_choice.name}! They meet #{neighborhood_array[rand(0...neighborhood_array.length)]} at #{host_choice.location.name} on #{day_array[rand(0...day_array.length)]} #{time_array[rand(0...day_array.length)]}."
  end

  def guest_suggestion(current_user)
    guest_matches = current_user.match_to_guest
    puts "Based on your labels, might we suggest getting together with:"
    if guest_matches.length == 0
      guest_number = 0
      current_user.host.users.each do |guest|
        guest_labels = guest.labels.map { |label| label.name }
        print "#{guest.name}, who revels in "
        if guest_labels.length == 1
          puts "#{guest_labels[0]}."
        elsif guest_labels.length == 2
          puts "#{guest_labels[0]} and #{guest_labels[1]}."
        else
          puts guest_labels[0..-2].join(", ") + ", and " + guest_labels[-1] + "."
        end
        guest_number += 1
        break if guest_number == 3
      end
      return current_user.host.users.map { |guest| guest.name }
    else
      guest_matches.each do |match|
        match_labels = match[1].map do |label|
          label.name
        end
        print "#{match[0]}, who also shares your fondness for "
        if match_labels.length == 1
          puts "#{match_labels[0]}."
        elsif match_labels.length == 2
          puts "#{match_labels[0]} and #{match_labels[1]}."
        else
          puts match_labels[0...match_labels.length].join(", ") + ", and " + match_labels[-1] + "."
        end
      end
      wildcard_guest = current_user.host.users[rand(0...current_user.host.users.length)]
      wildcard_guest_name = wildcard_guest.name
      wildcard_guest_topic = wildcard_guest.labels[rand(0...wildcard_guest.labels.length)].name
      puts "And make a point to introduce yourself to #{wildcard_guest_name} and ask them about #{wildcard_guest_topic}!"
      return guest_matches.map{ |guest| guest[0]}
    end
  end

  def final_confirmation
    puts "Come as you are and have a great time! Until next week!"
  end

end