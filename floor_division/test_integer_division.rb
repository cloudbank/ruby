require 'test/unit'
require_relative  'integer_division.rb'

class IntegerDivisionTests < Test::Unit::TestCase

  def num_equals_divisor_floor_div()
    assert_equal(IntegerDivision.floor_division(-6,-6), ([1,0] ))
    assert_equal(IntegerDivision.floor_division(5,5), ([1,0] ))
  end

  def test_both_positive_num_bigger_floor_div()
    assert_equal(IntegerDivision.floor_division(6,5), ([1 , 1] ))
    assert_equal(IntegerDivision.floor_division(60,5), ([12,0] ))
    assert_equal(IntegerDivision.floor_division(60,1), ([60,0] ))
  end
  
  def test_one_neg_num_bigger_floor_div()
    assert_equal(IntegerDivision.floor_division(-6,5), ([-2,4] ))
    assert_equal(IntegerDivision.floor_division(6,-5), ([-2,-4] ))
  end
  
   def test_both_neg_num_bigger_floor_div()
    assert_equal(IntegerDivision.floor_division(-6,-5), ([1,-1] ))
    assert_equal(IntegerDivision.floor_division(-60,-5), ([12,0] ))
  end
  
   def test_both_positive_num_smaller_floor_div()
    assert_equal(IntegerDivision.floor_division(1,5), ([0,1] ))
    assert_equal(IntegerDivision.floor_division(60,6000), ([0,60] ))
  end
  
   def test_one_neg_num_smaller_floor_div()
    assert_equal(IntegerDivision.floor_division(-1,5), ([-1,4] ))
    assert_equal(IntegerDivision.floor_division(1,-5), ([-1,-4] ))
  end
  
  def test_both_neg_num_smaller_floor_div()
    assert_equal(IntegerDivision.floor_division(-1,-5), ([0,-1] ))
    assert_equal(IntegerDivision.floor_division(-6,-500), ([0,-6] ))
  end
  
  def test_both_neg_num_bigger_floor_div()
    assert_equal(IntegerDivision.floor_division(-6,-5), ([1,-1] ))
    assert_equal(IntegerDivision.floor_division(-60,-5), ([12,0] ))
  end
  
  def test_divide_by_zero_floor_division()
    assert_raise RuntimeError do
      IntegerDivision.floor_division(-6,0)
	end  
  end
 
  def test_nil_input_floor_division()
    assert_raise RuntimeError do
      IntegerDivision.floor_division(nil,10)
	end  
  end
   
  def test_num_equals_div_floor_division()
     assert_equal(IntegerDivision.floor_division(-6,-6), ([1,0] ))
	 assert_equal(IntegerDivision.floor_division(5,5), ([1,0] ))
  
  end
  
  def test_binary_search_absolute_division()
     assert_equal(IntegerDivision.binary_search_absolute_division((1..6).to_a,6,6), (1 ))
	 assert_equal(IntegerDivision.binary_search_absolute_division((1..6).to_a,6,5), (1 ))
	 assert_equal(IntegerDivision.binary_search_absolute_division((6..60).to_a,60,6), (10 ))
     assert_equal(IntegerDivision.binary_search_absolute_division((1..60).to_a,60,1), (60 ))
     assert_equal(IntegerDivision.binary_search_absolute_division((1..60).to_a,1,60), (nil ))
	
  end
  def test_neg_input_binary_search_absolute_division()
    assert_raise RuntimeError do
      IntegerDivision.binary_search_absolute_division((-1..10).to_a,-1,10)
	end  
  end
  
  def test_unsorted_array__binary_search_absolute_division()
    assert_raise RuntimeError do
      IntegerDivision.binary_search_absolute_division((100..10).to_a,-1,10)
	end  
  end
  
  def test_remainder()
     assert_equal(IntegerDivision.remainder(6,5,1), (1 ))
     assert_equal(IntegerDivision.remainder(-6,5,-2), (4 ))
  end
  
  def test_is_result_neg()
    assert_equal(IntegerDivision.isResultNegative?(6,5),(false ))
    assert_equal(IntegerDivision.isResultNegative?(-6,5), (true ))
  end	 
  
  
end