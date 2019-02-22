require 'csv'

class DeckBuilder
  attr_accessor :cards
  attr_reader :file, :card_stats
  def initialize(file)
    @file = file
    @cards = create_deck
    @card_stats = compile_card_hash
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
    return card_arr
  end

  def compile_card_hash
    card_hash = {}
    CSV.foreach(file, headers: false) do |line|
      if card_hash.has_key?(line[0].to_sym)
        card_hash[line[0].to_sym] << line[1]
      else
        card_hash[line[0].to_sym] = []
        card_hash[line[0].to_sym] << line[1]
      end
    end
    return card_hash
  end

  def print_stats
    card_stats.each do |key, value|
      puts "---------------------------------------"
      puts "card type #{key.upcase} has #{value.length} cards:"
      puts "---------------------------------------"
      puts value
    end
  end
end
