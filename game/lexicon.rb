class Lexicon
#  This is an improved lexicon from "Learning Ruby The Hard Way"
#  The mixed hash access in ruby allows for a much more terse version.
  def scan(input)
    hash = {'north' => :direction, 'south' => :direction,'east' => :direction,'1' => :number }
    words = input.split()
    words.map { |t|  hash.include?(t) ? Pair.new(hash[t],t) : Pair.new(:error,t) }
  end 
end
Pair = Struct.new(:token, :word)

################################
# also see test_lexicon.rb
################################
lex = Lexicon.new
puts lex.scan('north') == [Pair.new(:direction,'north')]
puts lex.scan('1 north')
m = lex.scan('aussie girdle 3 1')
puts m
puts m == [Pair.new(:error,"aussie"),Pair.new(:error,"girdle"),Pair.new(:error, "3"),Pair.new(:number,"1")]
puts m.class
puts lex.scan('north is best')


