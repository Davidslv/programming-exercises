require 'spec_helper'
require './lib/blackjack'

describe Blackjack do
  let(:game) { Blackjack.new }

  context "Player gets over 21" do
    before do
      game.stub(deal_dealer_hand: Hand.new([Card.new(:clubs, 10), Card.new(:spades, 7)]))
      game.stub(deal_hand: Hand.new([Card.new(:clubs, 10), Card.new(:spades, 7)]))
      game.stub(deal_card: Card.new(:clubs, 5))
      game.start
    end

    it "should loose the game" do
      game.deliver_card
      game.should_not be_won
    end
  end

  context "Player stands on 18 and dealer gets 17" do
    before do
      game.stub(deal_hand: Hand.new([Card.new(:clubs, 10), Card.new(:spades, 8)]))
      game.stub(deal_dealer_hand: Hand.new([Card.new(:clubs, 10), Card.new(:spades, 7)]))
      game.start
    end

    it "should win the game" do
      game.should be_won
    end
  end

  context "Player and dealer have the same points" do
    before do
      game.stub(deal_hand: Hand.new([Card.new(:clubs, 10), Card.new(:spades, 8)]))
      game.stub(deal_dealer_hand: Hand.new([Card.new(:clubs, 10), Card.new(:spades, 8)]))
      game.start
    end

    it "should draw the game" do
      game.should be_draw
    end
  end
end
