note: tests are still under refactor from previous

/ccProcessor
  this is a credit card processor that uses luhn10 to verify cc number and 
  process methods as they are called off from a text file
  the /cmd dir has the Command Pattern version; a refactor from a terser hack
  that used ruby's dynamic capabilities, essentially self.send.  A labor
  of love to help remember why patterns are important
   

  /cmd  
     Client = credit_card_client.rb
     Invoker = credit_card_processor.rb
     Receiver = credit_card.rb
     Cmds = charge_command.rb, credit_command.rb
