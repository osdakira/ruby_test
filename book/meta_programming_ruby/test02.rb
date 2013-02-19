@@v=1
p "out module " + @@v.to_s

module M
  @@v=2
  class MyClass
    @@v=3
  end

  p "in module " + @@v.to_s
end

p "out module " + @@v.to_s
