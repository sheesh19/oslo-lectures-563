# Add an #hit_by(move) instance method in Pokemon which returns a sentence like “Squirtle was hit by Charm”.

#Then override this method for the ElectricClass class, and return a sentence like “Pikachu was hit by Charm. It was super effective!”

class Pokemon
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.starter_types
    ["Fire", "Water", "Grass"]
  end

  def hit_by(move)
    "#{@name.capitalize} was hit by #{move}."
  end
end
