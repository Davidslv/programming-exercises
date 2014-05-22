class Deck
  SUITS = %w(clubs diamonds spades hearts)
  RANKS = (2..14).to_a

  ROYAL_RANKS = (10..14).to_a

  attr_reader :cards

  def initialize(game)
    case game
    when 'holdem', 'omaha'
      @cards = create_shuffled_deck(SUITS, RANKS)
    when 'royal'
      @cards = create_shuffled_deck(SUITS, ROYAL_RANKS)
    else
      raise 'Your game is not available in this table!'
    end
  end

  def deal_card
    card = @cards.pop
    card.value
  end

  private

  def create_shuffled_deck(suits, ranks)
    suits.product(ranks).map { |suit, rank|
      Card.new(suit, rank)
    }.shuffle!
  end
end
