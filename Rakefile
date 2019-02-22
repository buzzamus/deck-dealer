require './lib/deck_builder'


namespace :deck do
  puts "What is the name of your file?"
  print "> "
  file = $stdin.gets.chomp
  tested_deck = DeckBuilder.new(file)
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

  task :stats do
    tested_deck.print_stats
  end
end
