require './poker_table/card'
require './poker_table/deck'
require './poker_table/dealer'

class PokerTable

  attr_reader :deck, :betting_type, :type

  def initialize(options)
    options = {
                game: 'holdem',
                type: 'ring',
                betting_type: 'NL'
              }.merge(options)

    @game         = options[:game]
    @deck         = Deck.new(@game)
    @type         = options[:type]
    @betting_type = options[:betting_type]
    @board_cards  = []

    @dealer       = Dealer.new(@deck, @board_cards)
  end

  def deal_hole_cards
    @dealer.deal_hole_cards
  end

  def deal_board_cards
    @dealer.deal_board_cards
  end

  # def deal_hole_cards
  #   cards = []
  #   if omaha?
  #     4.times { cards << @deck.deal_card }
  #   else
  #     2.times { cards << @deck.deal_card }
  #   end
  #
  #   cards
  # end
  #
  # def deal_board_cards
  #   if flop?
  #     3.times { @board_cards << @deck.deal_card }
  #   elsif turn_card? || river_card?
  #     @board_cards << @deck.deal_card
  #   end
  #
  #   @board_cards
  # end

  def min_raise
    case @betting_type
    when 'NL', 'PL'
      20
    when 'FL'
      100
    end
  end

  def max_raise
    case @betting_type
    when 'NL'
      300
    when 'PL'
      200
    when 'FL'
      100
    end
  end
end
