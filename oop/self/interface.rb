require_relative 'castle'
require_relative 'wizard'
require 'pry'



hogwarts = Castle.new('Hogwarts', 'Dumbledore', 4000, 10000)


p hogwarts.name
# p hogwarts.ruler
# p hogwarts.has_a_wizard?
# hogwarts.ruler = 'Harry'


# p hogwarts.floor_area

# p Castle.categories
# p hogwarts.categories


# INSTANCE VS CLASS

# p Castle.castle_details
p hogwarts.castle_details

