require './lib/deck_builder'

describe 'deck_builder' do
  # create 2 objects to ensure they are the same, but different (card randomness)
  let(:deck) { DeckBuilder.new('test.csv') }
  let(:deck2) { DeckBuilder.new('test.csv') }

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

  it 'creates a hash from the included CSV file' do
    test_hash = {
      creature: [
        'Ravenous Chupacabra',
        'Thief of Sanity',
        'Biogenic Ooze',
        'Ravenous Chupacabra',
        'Thief of Sanity',
        'Thief of Sanity',
        'Thief of Sanity',
        'Etrata the Silencer',
        'Etrata the Silencer',
        'Etrata the Silencer',
        'Etrata the Silencer',
        'Golgari Findbroker',
        'Golgari Findbroker',
        'Golgari Findbroker',
        'Golgari Findbroker',
        'Biogenic Ooze',
        'Biogenic Ooze',
        'Pestilent Spirit',
        'Ochran Assassin',
        'Pestilent Spirit',
        'Druid of the Cowl',
        'Druid of the Cowl',
        'Druid of the Cowl',
        'Vampire Sovereign'
      ]

    }
    expect(deck.card_stats[:creature].sort).to eq(test_hash[:creature].sort)
  end

  it 'returns the size of each card type' do
    expect(deck.card_stats[:creature].length).to eq(24)
  end
end
