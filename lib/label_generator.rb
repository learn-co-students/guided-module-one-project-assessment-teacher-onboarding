class LabelGenerator
  attr_accessor :animals, :powers, :colors, :foods, :existing
  
  def initialize
    @animals = []
    @powers = []
    @colors = []
    @foods = []
    @existing = []
    6.times { @animals << Faker::Creature::Animal.name.downcase }
    6.times { @powers << Faker::Superhero.power.downcase }
    6.times { @colors << Faker::Color.color_name.downcase }
    6.times { @foods << Faker::Food.dish.downcase }
    6.times { @existing << Label.all[rand(0...Label.all.length)].name }
  end

  def populate_animals
    if @animals.length != 0
      @animals.clear
    end
    6.times { @animals << Faker::Creature::Animal.name.downcase }
  end

  def populate_powers
    if @powers.length != 0
      @powers.clear
    end
    6.times { @powers << Faker::Superhero.power.downcase }
  end

  def populate_colors
    if @colors.length != 0
      @colors.clear
    end
    6.times { @colors << Faker::Color.color_name.downcase }
  end

  def populate_foods
    if @foods.length != 0
      @foods.clear
    end
    6.times { @foods << Faker::Food.dish.downcase }
  end

  def populate_existing
    if @foods.length != 0
      @foods.clear
    end
    6.times { @existing << Label.all[rand(0...Label.all.length)].name }
  end

  def print_labels(array)
    array.each do |element|
      print "| #{element} |"
    end
    puts ""
    array
  end
end