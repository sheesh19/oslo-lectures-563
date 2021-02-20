require_relative 'pokemon'

class FirePokemon < Pokemon

  def move
    "#{@name.capitalize} uses Ember"
  end
end
