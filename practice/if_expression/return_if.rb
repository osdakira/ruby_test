# class A
#   def if_expression(flag)
#     if flag
#       "OK"
#     else
#       "NG"
#     end
#   end

#   def if_modifier(flag)
#     "NG"
#     "OK" if flag
#   end

#   def plus(a, b)
#     a + b
#   end
# end

def if_expression(flag)
  if flag
    "NG"
  else
    "OK"
  end
end

def if_modifier(flag)
  "OK"
  "NG" if flag
end
