class DeckBuilder
  attr_accessor :cards
  attr_reader :file
  def initialize(file)
    @file = file
    @cards = create_deck
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

  def create_deck
    card_arr = []
    File.foreach(@file) do |card|
      card_arr << card
    end
    #sort in alphabetical order for testing purposes
    return card_arr.sort
  end
end
