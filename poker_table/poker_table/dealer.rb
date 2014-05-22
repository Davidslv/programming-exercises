class Dealer

  def initialize(deck, board_cards)
    @deck        = deck
    @board_cards = board_cards
  end

  def deal_hole_cards
    cards = []
    if omaha?
      4.times { cards << @deck.deal_card }
    else
      2.times { cards << @deck.deal_card }
    end

    cards
  end

  def deal_board_cards
    if flop?
      3.times { @board_cards << @deck.deal_card }
    elsif turn_card? || river_card?
      @board_cards << @deck.deal_card
    end

    @board_cards
  end

  private

  def omaha?
    @game == 'omaha'
  end

  def flop?
    @board_cards.empty?
  end

  def turn_card?
    @board_cards.size == 3
  end

  def river_card?
    @board_cards.size == 4
  end
end
