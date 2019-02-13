class DeckTester
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def shuffle
    cards.shuffle!
  end

  def initial_deal
    cards.shift(7)
  end

  def deal
    cards.shift
  end
end
