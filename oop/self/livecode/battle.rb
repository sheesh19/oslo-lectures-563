require_relative 'pokemon'
require_relative 'water_pokemon'
require_relative 'electric_pokemon'
require_relative 'grass_pokemon'
require_relative 'fire_pokemon'

# Define a Pokemon with an initialize(name) constructor, exposing its name.

# Define four other classes: WaterPokemon, FirePokemon, GrassPokemon, ElectricPokemon classes

# Implement a #move instance method which returns a sentence like "Squirtle uses Water Gun" for each pokemon.

# In another Ruby file, create an array with Pikachu, Squirtle, Charmander & Bulbasaur, iterate over it and puts the move each pokemon make

# Implement a ::starter_types class method which will return an array of the three types of pokemon starters.

# Add an #hit_by(move) instance method in Pokemon which returns a sentence like “Squirtle was hit by Charm”. Then override this method for the ElectricClass class, and return a sentence like “Pikachu was hit by Charm. It was super effective!”

pikachu = ElectricPokemon.new('pikachu')
# squirtle = WaterPokemon.new('squirtle')
# bulbasaur = GrassPokemon.new('bulbasaur')
# charmander = FirePokemon.new('charmander')

# pokemon = [pikachu, squirtle, bulbasaur, charmander]

# pokemon.each do |pokemon|
#   puts pokemon.move
# end

# puts Pokemon.starter_types

puts pikachu.hit_by('charm')















