require './lib/deck_builder'

describe 'deck_builder' do
  let(:deck) { DeckBuilder.new('cards.txt') }

  it 'shuffles the array into random order' do
    deck.shuffle
    expect(deck.cards.count).to eq(60)
    expect(deck.create_deck).to eq(deck.cards.sort)
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

  it 'stops dealing card values when the deck is empty' do
    deck.initial_deal
    4.times do
      deck.deal
    end
    expect(deck.cards.length).to eq(49)
  end
end
