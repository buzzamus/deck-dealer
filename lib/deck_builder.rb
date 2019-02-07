class DeckBuilder
  attr_reader :file, :deck
  def initialize(file)
    @file = file
    @deck = []
  end

  def create_deck
    File.foreach(file) do |card|
      deck << card
    end
    return deck
  end
end
