# 平方根

def sqrt(n)
      # 平方根に最も近い大きい方の整数を探す
	  larger_than_int = 0
	  (0..n).each{|i| 
	  	if i * i > n
	  		larger_than_int = i
	  		break
	  	end
      }
      value = larger_than_int
      (0..n).each{|i|
      	delta = value + (n.to_f / value) # 微分？
      	value = delta / 2
      }
      return value
end

(2..10).each{|i| puts sqrt(i)}

# 1.4142156862745097
# 1.7320508075688772
# 2.0
# 2.23606797749979
# 2.449489742783178
# 2.6457513110645907
# 2.82842712474619
# 3.0
# 3.162277660168379

