a = [{a: 1, b: {c: 2, d: {e: 3}}}, 4]

def convert_value(value)
  if value.is_a?(Array)
    value.dup.replace(value.map { |e| convert_value(e) })
  else
    value
  end
end

def convert_value_simple(value)
  if value.is_a?(Array)
    value.map { |e| convert_value(e) }
  else
    value
  end
end

b = convert_value(a)
c = convert_value_simple(a)
p a
p b
p c

p "-" *  10

b[0][:a] = 2
p a
p b
p c

p "-" *  10

b[2] = 5
p a
p b
p c

p "-" *  10

c[2] = 7
p a
p b
p c

p "-" *  10

b[3] = 9
p a
p b
p c

p "-" *  10

c[3] = 11
p a
p b
p c

raise "assert" unless a[0][:a] == 1
