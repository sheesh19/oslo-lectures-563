require_relative "../electric_pokemon"

describe ElectricPokemon do
  describe "#move" do
    it "returns a sentence stating the pokemon is performing a move" do
      pikachu = ElectricPokemon.new("pikachu")
      expect(pikachu.move).to eq("Pikachu uses Thunder Shock")
    end
  end

  describe "#hit_by" do
    it "overrides Pokemon#hit_by and returns a cruel sentence" do
      pikachu = ElectricPokemon.new("pikachu")
      sentence = pikachu.hit_by("mudslap")
      expect(sentence).to eq("Pikachu was hit by mudslap. It was super effective!")
    end
  end
end
