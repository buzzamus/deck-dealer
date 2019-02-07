class DeckTester
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def shuffle
    cards.shuffle!
  end
end
