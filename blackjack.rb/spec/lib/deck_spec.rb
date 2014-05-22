require 'spec_helper'
require './lib/deck'

describe Deck do
  subject { Deck.new }

  its(:size) { should == 52 }

  context '#deliver' do
    before { subject.deliver! }
    its(:cards) { should have(51).cards }
  end
end
