require_relative 'credit_card_client'
require_relative 'credit_card_processor'

require 'test/unit'
 
class TestCreditCardClient < Test::Unit::TestCase
 
 def setup
	@@ccl = CreditCardClient.new
  end
  
  def test_methods_exist
   assert_respond_to(@@ccl,'processCmd')
	 assert_respond_to(@@ccl,'getCard')
	 assert_respond_to(@@ccl,'printOut') 
	 assert_respond_to(@@ccl,'scanFile')
  end


 
  def test_scanFile
     # @@ccl.scanFile
      #assert_equal(3, @@ccl.accounts.size)
  end
  
 
  
end