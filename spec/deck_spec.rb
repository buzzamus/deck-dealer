require './lib/deck_builder'
require './lib/deck_tester'

describe 'deck_builder' do
  let(:test_arr) { ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'] }
  let(:deck) { DeckTester.new(test_arr.dup) }

  it 'shuffles the array into random order' do
    deck.shuffle
    expect(deck.cards.count).to eq(test_arr.count)
    expect(test_arr).not_to eq(deck.cards)
    expect(test_arr).to eq(deck.cards.sort)
  end

  it 'deals 7 cards for initial hand' do
    opening_hand = deck.initial_deal
    expect(opening_hand.length).to eq(7)
  end

  it 'deals another card when prompted' do
    current_hand = []
    current_hand.push(deck.deal)
    expect(current_hand.length).to eq(1)
  end

  it 'stops dealing cards when the deck is empty' do
    deck.initial_deal
    4.times do
      deck.deal
    end
    expect(deck.cards.length).to eq(0)
  end
end
