require './lib/deck_builder'
require './lib/deck_tester'

desc 'Runs main program'
task :start do
  deck = DeckBuilder.new('cards.txt').create_deck
  tested_deck = DeckTester.new(deck)
  tested_deck.shuffle
  puts tested_deck.cards[(0..6)]
end
