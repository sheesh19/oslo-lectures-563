require_relative 'pokemon'

class ElectricPokemon < Pokemon

  def move
    "#{@name.capitalize} uses Thunder Shock"
  end

  def hit_by(move)
    "#{super} It was super effective!"
  end
end
