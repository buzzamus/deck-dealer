require './lib/deck_builder'

describe 'deck_builder' do
  # create 2 objects to ensure they are the same, but different (card randomness)
  let(:deck) { DeckBuilder.new('cards.txt') }
  let(:deck2) { DeckBuilder.new('cards.txt') }

  it 'shuffles the array into random order' do
    deck.shuffle
    expect(deck.cards.count).to eq(60)
    expect(deck.cards).not_to eq(deck2.cards)
    expect(deck.cards.sort).to eq(deck2.cards.sort)
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

  it 'removes card from deck after card is dealt' do
    deck.initial_deal
    4.times do
      deck.deal
    end
    expect(deck.cards.length).to eq(49)
  end
end
