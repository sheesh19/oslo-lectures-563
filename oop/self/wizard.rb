require_relative 'castle'

class Wizard
  def initialize(castle)
    @castle = castle # We want @house to store an instance of House
  end

  def cast_magic
    puts "Casting magic in #{@castle.name}!"
  end
end
