class CreditCommand
  
  def initialize(creditCard, amount)
    @amount = amount
    @cc = creditCard
  end
 
  attr_accessor  :amount
  attr_accessor :cc
 
  def execute()
    @cc.credit(@amount);
 end

end
