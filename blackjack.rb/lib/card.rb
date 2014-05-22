class Card

  def initialize(suit, value)
    @value = value
  end

  def value
    case @value
    when 'J', 'Q', 'K'
      10
    when 'A'
      11
      # pseudo thinking
      # 1 if count > 10
      # 11 if count <= 10
    else
      @value.to_i
    end
  end
end
