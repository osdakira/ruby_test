class A
  def a=(a)
    @a = a
  end

  def a
    @a
  end
end

class B
  def a=(a)
    @a = a
  end

  def a
    return @a if instance_variable_defined?(:@a)
    "b"
  end
end

require 'minitest/unit'
require 'minitest/autorun'

class ATest < MiniTest::Unit::TestCase
  def test_undefined_instance_variable_is_nil
    a = A.new
    assert_equal nil, a.a
  end
end

class BTest < MiniTest::Unit::TestCase
  def test_undefined_instance_variable_is_constant
    b = B.new
    assert_equal "b", b.a
  end

  def test_gettable_instance_variable_after_set
    b = B.new
    b.a = "a"
    assert_equal "a", b.a
  end
end
