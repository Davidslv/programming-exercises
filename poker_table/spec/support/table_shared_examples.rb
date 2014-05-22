shared_examples 'a ring poker table' do
  its(:deck) { should have(52).cards }
  its(:type) { should == 'ring' }
end

shared_examples 'it has different betting types' do |deck|
  context "#{deck} betting type is NL" do
    let(:options) { {:deck => deck, :betting_type => 'NL'} }
    its(:min_raise) { should eql(20) }
    its(:max_raise) { should eql(300) }
  end

  context "#{deck} betting type is PL" do
    let(:options) { {:deck => deck, :betting_type => 'PL'} }
    its(:min_raise) { should eql(20) }
    its(:max_raise) { should eql(200) }
  end

  context "#{deck} betting type is FL" do
    let(:options) { {:deck => deck, :betting_type => 'FL'} }
    its(:min_raise) { should eql(100) }
    its(:max_raise) { should eql(100) }
  end
end


shared_examples 'deals cards' do |deck|
  context "when is #{deck}" do
    context 'when is the flop turn' do
      its(:deal_board_cards) { should have(3).cards }
    end

    context 'when is the turn card' do
      before do
        subject.deal_board_cards
      end

      its(:deal_board_cards) { should have(4).cards }
    end

    context 'when is the river card' do
      before do
        # flop and turn card
        2.times { subject.deal_board_cards }
      end

      its(:deal_board_cards) { should have(5).cards }
    end
  end
end
