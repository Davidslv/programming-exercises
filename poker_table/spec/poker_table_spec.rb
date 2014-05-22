require 'spec_helper'

require './poker_table'

describe PokerTable do
  subject { described_class.new(options) }

  context 'Texas Holdem' do

    context 'ring type' do
      let(:options) { {game: 'holdem'} }
      it_behaves_like 'a ring poker table'
      it_behaves_like 'it has different betting types', 'holdem'
      it_behaves_like 'deals cards', 'holdem'

      its(:deal_hole_cards) { should have(2).cards }

      it 'has less 2 cards in the deck' do
        subject.deal_hole_cards
        subject.deck.should have(50).cards
      end
    end

    context 'mtt type' do
      let(:options) { {game: 'holdem', type: 'mtt'} }
      it_behaves_like 'it has different betting types', 'holdem'
      it_behaves_like 'deals cards', 'holdem'

      its(:type) { should eql('mtt') }
      its(:deck) { should have(52).cards }
      its(:deal_hole_cards) { should have(2).cards }

      it 'has less 2 cards in the deck' do
        subject.deal_hole_cards
        subject.deck.should have(50).cards
      end
    end
  end

  context 'Omaha' do
    context 'ring type' do
      let(:options) { {game: 'omaha'} }
      it_behaves_like 'a ring poker table'
      it_behaves_like 'it has different betting types', 'omaha'
      it_behaves_like 'deals cards', 'omaha'

      its(:deal_hole_cards) { should have(4).cards }

      it 'has less 4 cards in the deck' do
        subject.deal_hole_cards
        subject.deck.should have(48).cards
      end
    end

    context 'mtt type' do
      let(:options) { {game: 'omaha', type: 'mtt'} }
      it_behaves_like 'it has different betting types', 'omaha'
      it_behaves_like 'deals cards', 'omaha'

      its(:type) { should eql('mtt') }
      its(:deck) { should have(52).cards }
      its(:deal_hole_cards) { should have(4).cards }

      it 'has less 4 cards in the deck' do
        subject.deal_hole_cards
        subject.deck.should have(48).cards
      end
    end
  end

  context 'Royal' do
    context 'ring type' do
      let(:options) { {game: 'royal'} }
      it_behaves_like 'it has different betting types', 'royal'
      it_behaves_like 'deals cards', 'royal'

      its(:type) { should eql('ring') }
      its(:deck) { should have(20).cards }
      its(:deal_hole_cards) { should have(2).cards }

      it 'has less 2 cards in the deck' do
        subject.deal_hole_cards
        subject.deck.should have(18).cards
      end
    end

    context 'mtt type' do
      let(:options) { {game: 'royal', type: 'mtt'} }
      it_behaves_like 'it has different betting types', 'royal'
      it_behaves_like 'deals cards', 'royal'

      its(:type) { should eql('mtt') }
      its(:deck) { should have(20).cards }
      its(:deal_hole_cards) { should have(2).cards }

      it 'has less 2 cards in the deck' do
        subject.deal_hole_cards
        subject.deck.should have(18).cards
      end
    end
  end

end
