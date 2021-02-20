require_relative 'pokemon'

class GrassPokemon < Pokemon

  def move
    "#{@name.capitalize} uses Vine Whip"
  end
end
