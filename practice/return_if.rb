class A
  def if_expression(flag)
    if flag
      "OK"
    else
      "NG"
    end
  end

  def if_modifier(flag)
    "NG"
    "OK" if flag
  end
end

require 'minitest/unit'
require 'minitest/autorun'

class ATest < MiniTest::Unit::TestCase
  def setup
    @a = A.new
  end

  def test_if_expression
    assert_equal "OK", @a.if_expression(true)
    assert_equal "NG", @a.if_expression(false)
  end

  def test_if_mofifier
    assert_equal "OK", @a.if_modifier(true)
    assert "NG" != @a.if_modifier(false)
    assert_equal nil, @a.if_modifier(false)
  end
end
