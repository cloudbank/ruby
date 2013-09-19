/ccProcessor
  this is a credit card processor that uses luhn10 to verify cc number and 
  process methods as they are called off from a text file
  the /cmd dir has the Command Pattern version; a refactor from a terser hack
  that used ruby's dynamic capabilities, essentially self.send.  A labor
  of love to help remember why patterns are important

  /cmd  



/game

lexicon.rb:
  	This is an improved lexicon from "Learning Ruby The Hard Way".
  	The mixed hash access in ruby allows for a much more terse version.

game.rb:
	 This is funny game from "Learning Ruby The Hard Way" that I put into
	 separate files as an exercise in dynamic methods and ruby OO. I plan
	 to turn it into a different game eventually.

/test


test_lexicon.rb: 
	A test for Lexicon.scan().
---------------------------------------------------------------------------	
/floor_division


This is a first attempt at integer division without the '/' operator.
It uses binary search.  I kept the methods public because I wanted to test them.


integer_divsion.rb  
	several useful methods besides floor division
	
test_integer_division.rb
	lots of tests for all the methods