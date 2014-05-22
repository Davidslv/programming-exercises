require 'spec_helper'
require './lib/hand'

describe Hand do

  describe "#total" do
    context "without image cards" do
      let(:hand) { Hand.new([Card.new(:clubs, 2), Card.new(:diamonds, 10)]) }

      it "outputs the total value of the hand" do
        hand.total.should == 12
      end
    end

    context "with image cards" do
      it "should output 20 with J, K" do
        hand = Hand.new([Card.new(:clubs, 'J'), Card.new(:hearts, 'K')])
        hand.total.should == 20
      end

      it "should output 19 with 9, K" do
        hand = Hand.new([Card.new(:clubs, 9), Card.new(:hearts, 'K')])
        hand.total.should == 19
      end

      it "should output 21 with A, K" do
        hand = Hand.new([Card.new(:clubs, 'A'), Card.new(:hearts, 'K')])
        hand.total.should == 21
      end
    end
  end
end
