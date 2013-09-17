require 'test/unit'
require_relative "../game/lexicon"

class LexiconTests < Test::Unit::TestCase

  Pair = Lexicon::Pair
  @@lexicon = Lexicon.new()

  def test_directions()
    assert_equal([Pair.new(:direction, 'north')], @@lexicon.scan("north"))
    result = @@lexicon.scan("north south east")
    assert_equal(result, [Pair.new(:direction, 'north'),
                Pair.new(:direction, 'south'),
                Pair.new(:direction, 'east')])
  end
end