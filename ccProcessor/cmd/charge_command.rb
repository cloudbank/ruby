class ChargeCommand

  def initialize(creditCard, amount)
    @amount = amount
    @cc = creditCard
  end

  attr_accessor  :amount
  attr_accessor :cc
  
  def execute()
    @cc.charge(@amount);
  end
end
