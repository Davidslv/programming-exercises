require 'card'
require 'hand'
require 'deck'

class Blackjack
  def start
    @deck        = Deck.new
    @player_hand = deal_hand
    @dealer_hand = deal_dealer_hand
  end

  def deliver_card
    @player_hand << @deck.deliver!
  end

  def won?
    !@player_hand.busted? && @player_hand >= @dealer_hand
  end

  def draw?
    !@player_hand.busted? && @player_hand == @dealer_hand
  end
end
