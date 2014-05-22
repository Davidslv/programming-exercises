class Hand
  include Comparable

  def initialize(cards)
    @cards = cards
  end

  def busted?
    total > 22
  end

  def total
    # count = 0
    # @cards.each do |card|
    #   count += card.value
    # end
    # count
    count = 0
  end

  # def ace?
  #   @cards.include?('A')
  # end

  def <<(card)
    @cards << card
  end

  def <=>(other)
    self.total <=> other.total
  end
end
