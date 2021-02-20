require_relative "../pokemon"
require_relative "../water_pokemon"

describe Pokemon do
  describe "#initialize" do
    it "creates a Pokemon instance" do
      pikachu = Pokemon.new("pikachu")
      expect(pikachu).to be_a(Pokemon) # New matcher for students.
    end
  end

  describe "::starter_types" do
    it "returns the three starter types" do
      starter_types = Pokemon.starter_types
      expect(starter_types.size).to eq(3)
    end
  end

  describe "#hit_by" do
    it "returns a sentence stating the pokemon was hit" do
      squirtle = WaterPokemon.new("squirtle")
      sentence = squirtle.hit_by("flamethrower")
      expect(sentence).to eq("Squirtle was hit by flamethrower.")
    end
  end
end
