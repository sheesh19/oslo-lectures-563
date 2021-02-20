require_relative 'pokemon'

class WaterPokemon < Pokemon

  def move
    "#{@name.capitalize} uses Water Gun"
  end
end
