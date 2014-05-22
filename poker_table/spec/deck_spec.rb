require 'spec_helper'
require './poker_table/deck'

describe Deck do
  subject { described_class.new(game) }

  context "when is holdem" do
    let(:game) { 'holdem' }

    its(:cards) { should have(52).cards }

    context '#deal_card' do
      it "takes one card from the deck" do
        subject.deal_card
        subject.should have(51).cards
      end
    end
  end

  context "when is omaha" do
    let(:game) { 'omaha' }

    its(:cards) { should have(52).cards }

    context '#deal_card' do
      it "takes one card from the deck" do
        subject.deal_card
        subject.should have(51).cards
      end
    end
  end

  context "when is royal" do
    let(:game) { 'royal' }

    its(:cards) { should have(20).cards }

    context '#deal_card' do
      it "takes one card from the deck" do
        subject.deal_card
        subject.should have(19).cards
      end
    end
  end

  context "when the game it's not implemented" do
    it 'should raise an exception' do
      expect { Deck.new('blackjack') }.to raise_error(RuntimeError)
    end
  end

end
