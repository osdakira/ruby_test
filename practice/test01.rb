#(1..5).each{|i|puts i}

#(1..ARGV[0].to_i).each{|i|puts i}

#(1..ARGV[0].to_i).each{|i|
#    ret = ""
#    ret += "Fizz" if i % 3 == 0 
#    ret += "Buzz" if i % 5 == 0
#    ret += "#{i}" if ret.empty?
#    print ret, " " 
#}


#def prime(n)
#    primes = []
#    (3..n).each{|i|
#       next if i % 2 == 0  
#       is_prime = true 
#       primes.each {|j|
#           if i % j == 0
#               is_prime = false 
#               break
#           end
#       }
#       primes.push(i) if is_prime
#    }
#    return primes 
#end
#
#puts prime(ARGV[0].to_i)

