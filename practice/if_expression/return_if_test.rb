require "./return_if"
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

  def test_if_expression_stack
    puts RubyVM::InstructionSequence.disasm(@a.method(:if_expression))
  end

  def test_if_mofifier_stack
    puts RubyVM::InstructionSequence.disasm(@a.method(:if_modifier))
  end

  # def test_plus
  #   puts RubyVM::InstructionSequence.disasm(@a.method(:plus))
  # end
end

# RubyVM::InstructionSequence.compile_option = {
#   trace_instruction: false
# }

# method = <<-EOF
# class A
#   def if_expression(flag)
#     "NG"
#     "OK" if flag
#   end
# end

# A.new.if_expression(true)
# EOF

# puts RubyVM::InstructionSequence.new(method).disasm

# method = <<-EOF
# class A
#   def if_expression(flag)
#     if flag
#       "OK"
#     else
#       "NG"
#     end
#   end
# end

# A.new.if_expression(false)
# EOF

# puts RubyVM::InstructionSequence.new(method).disasm

# set_trace_func lambda { |*args|
#   p args
# }
