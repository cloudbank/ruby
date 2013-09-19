require_relative 'credit_card'

require 'test/unit'

class TestCreditCard < Test::Unit::TestCase

  def setup
    @@cc = CreditCard.new

  end

  def test_methods_exist
    assert_respond_to(@@cc,'add', ['Tom','4111111111111111', '$1000' ])
    assert_respond_to(@@cc,'charge')
    assert_respond_to(@@cc,'credit')
    assert_respond_to(@@cc,'luhn?')
  end



  def test_add
    @@cc.add(['Test','4111111111111111', '$10000' ])
    assert_equal(10000,@@cc.limit)
  end

  def test_invalidCardNumber
    @@cc.add(['Quincy','1234567890123456', '$2000' ])
    assert_equal('error',@@cc.balance)
  end

  def test_luhn?
    assert_equal(true,@@cc.luhn?('4111111111111111'))
    assert_equal(false,@@cc.luhn?('1234567890123456'))
  end

  def test_charge_over_limit
    @@cc.add(['Test','4111111111111111', '$10000' ])
    @@cc.charge(['Test','$100000'])
    assert_equal(0.0,@@cc.cache['Test'].balance)
  end

  def test_charge_invalid_card
    @@cc.add(['Test','1234567890123456', '$10000' ])
    @@cc.charge(['Test','$100000'])
    assert_equal('error',@@cc.cache['Test'].balance)
  end

  def test_charge
    @@cc.add(['Test','4111111111111111', '$10000' ])
    @@cc.charge(['Test','$100'])
    assert_equal(100,@@cc.cache['Test'].balance)
  end

  def test_credit_invalid_card
    @@cc.add(['Test','1234567890123456', '$10000' ])
    @@cc.credit(['Test','$1000000'])
    assert_equal('error',@@cc.cache['Test'].balance)
  end

  def test_credit_neg_balance
    @@cc.add(['Test','4111111111111111', '$10000' ])
    @@cc.charge(['Test','$1000'])
    @@cc.credit(['Test','$1100'])
    assert_equal(-100.00,@@cc.cache['Test'].balance)
  end

end
