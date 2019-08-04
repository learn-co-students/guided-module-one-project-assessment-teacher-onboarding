require_relative 'label_generator'

class CommandLineInterface
  def initialize
    @labgen = LabelGenerator.new
  end

  def greet
    puts "Welcome to Labels, an old way to meet new people!"
    puts "To help us match you with a host, please select a few labels for yourself."
  end

  def set_user_name
    puts "What's your name?"
    user_name = gets.chomp
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



end