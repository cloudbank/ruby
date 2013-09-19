require_relative 'credit_card_processor'
require_relative 'credit_card'
require_relative 'credit_command'
require_relative 'charge_command'


class CreditCardClient
  #Client
  def initialize
    @ccp = CreditCardProcessor.new
  end

  def scanFile(filename)
    File.open(filename).each { | line|
      a = line.split()
      #check file method, check for other things maybe remedy
      if (@ccp.accounts.empty? || !@ccp.accounts.include?(a[1])) && a[0].downcase != 'add'
        raise "File in wrong order"
      end
      processCmd(a)

    }
  end

  def printOut

    #Law of Demeter refactor?
    Hash[@ccp.accounts.sort].each_value { |v|
      puts " #{v.name} : #{ v.balance} "
    }

  end

  protected
  def processCmd(a)

    method, name = a[0] , a[1]
    case
    when method.downcase == 'add'
      @ccp.accounts[name] = CreditCard.new(name,a[2], limit = a[3][1..a[3].size])
      return
    when method.downcase == 'charge'
      cmd = ChargeCommand.new(@ccp.accounts[name], amount = a[2][1..a[2].size])
    when method.downcase == 'credit'
      cmd = CreditCommand.new(@ccp.accounts[name], amount = a[2][1..a[2].size])
    end

    @ccp.storeAndExecute(cmd)

  end


end


c = CreditCardClient.new
#public API
c.scanFile('test.txt')
c.printOut

