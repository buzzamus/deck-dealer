class DeckBuilder
  attr_reader :file
  attr_accessor :deck
  def initialize(file)
    @file = file
    @deck = create_deck
  end

  def create_deck
    card_arr = []
    File.foreach(@file) do |card|
      card_arr << card
    end
    return card_arr
  end
end
