class Card

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def value
    "#{@rank} #{@suit}"
  end
end
