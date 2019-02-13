require './lib/deck_builder'
require './lib/deck_tester'

cards = DeckBuilder.new('cards.txt')
tested_deck = DeckTester.new(cards.deck)

namespace :deck do
  desc 'Runs main program'
  task :start do
    tested_deck.shuffle
    first_hand = tested_deck.initial_deal
    puts first_hand
    Rake::Task["deck:deal"].invoke
  end

  task :deal do
    puts "--------"
    puts "you drew: "
    puts tested_deck.deal
    puts "Draw again?"
    print "> "
    choice = $stdin.gets.chomp
    if choice == "y"
      Rake::Task["deck:deal"].reenable
      Rake::Task["deck:deal"].invoke
    end
  end
end
