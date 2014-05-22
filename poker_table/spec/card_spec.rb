require 'spec_helper'
require './poker_table/card'

describe Card do
  subject { described_class.new(suit, rank) }

  let(:suit) { :spades }
  let(:rank) { 14 }

  its(:value) { should eql('14 spades')}
end
