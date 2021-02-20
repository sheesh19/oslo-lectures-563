require 'pry'
# Test your code
binding.pry

class Hero
  # GETTERS & SETTERS

  attr_reader :dead
  # attr_writer :name
  attr_accessor :name, :alias_name

  def initialize(name, alias_name)
    # INSTANCE VARIABLES
    @name = name
    @alias_name = alias_name
    @dead = false
  end

  # attr_reader method
  # def name
  #   @name
  # end

  # attr_writer method
  # def name=(name)
  #   @name = name
  # end

  def dead?
    # question mark since this will return a boolean
    @dead
  end

  def hero_died!
    # exclamation since our state is about to change
    hero_battle
    hero_defeated
    @dead = true
  end

  private

  def hero_battle
    puts "Our hero meets their rival in battle!"
  end

  def hero_defeated
    puts "Our hero was defeated!"
  end

end
