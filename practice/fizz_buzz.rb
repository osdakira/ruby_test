for i in (1..20)
  if i % 3 == 0 && i % 5 == 0
    print "FizzBuzz "
  elsif i % 3 == 0
    print "Fizz "
  elsif i % 5 == 0
    print "Buzz "
  else
    print "#{i} "
  end
end

def fizzbuzz(i)
  if i % 3 == 0 && i % 5 == 0
    print "FizzBuzz "
  elsif i % 3 == 0
    print "Fizz "
  elsif i % 5 == 0
    print "Buzz "
  else
    print "#{i} "
  end
end

puts

(1..20).each do |i|
  fizzbuzz(i)
end

puts

20.times do |i|
  fizzbuzz(i + 1)
end

puts

20.times.with_index(1) do |_, i|
  fizzbuzz(i)
end

puts

1.upto 20 do |i|
  fizzbuzz(i)
end

puts
