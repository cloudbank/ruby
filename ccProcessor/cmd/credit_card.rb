require 'bigdecimal'
require 'bigdecimal/util'

class CreditCard
  #Receiver
 
  def initialize(name, number, limit)
    @name = name
    @balance = luhn?(number) ? 0.0 : 'error'
    @number = number
    @limit = limit
  end
  
  attr_accessor :number
  attr_accessor :name
  attr_accessor :limit
  attr_accessor :balance

  
  
  def charge(amount)
    if @balance != 'error'
      @balance += amount.to_d unless @balance + amount.to_d > @limit.to_d
      
    end
  end
 
  def credit(amount)
    if @balance != 'error'
      @balance -= amount.to_d
      
    end
  end
  
  def luhn?(number)
    odd = true
    sum = number.gsub(/\D/,'').reverse.split('').map(&:to_i).collect { |d|
      d *= 2 if odd = !odd
      d > 9 ? d - 9 : d
    }.inject(:+)
    sum  % 10 == 0
  end

end
