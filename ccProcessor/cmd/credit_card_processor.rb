class CreditCardProcessor
	# Invoker
  def initialize
    @accounts = {};
  end
  attr_accessor  :accounts
 
  def storeAndExecute(cmd)
    cmd.execute()
  end

end
