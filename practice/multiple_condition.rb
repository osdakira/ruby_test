class A
  def done
    "done"
  end

  def fail
    "fail"
  end
end

class B < A
end

class C < A
end

a = A.new
b = B.new
c = C.new

truth_table = {
  [true, true, true]   => [-> { a.done }, -> { b.done }, -> { c.done }],
  [true, true, false]  => [-> { a.done }, -> { b.done }, -> { c.done }],
  [true, false, true]  => [-> { a.done }, -> { b.fail }, -> { c.fail }],
  [true, false, false]  => [-> { a.done }, -> { b.fail }, -> { c.fail }],
  [false, true, true]  => [-> { a.fail }, -> { b.done }, -> { c.done }],
  [false, true, false] => [-> { a.fail }, -> { b.done }, -> { c.done }],
  [false, false, true] => [-> { a.fail }, -> { b.fail }, -> { c.fail }],
  [false, false, true] => [-> { a.fail }, -> { b.fail }, -> { c.fail }],
  [false, false, false] => [-> { a.fail }, -> { b.fail }, -> { c.fail }],
  [false, false, false] => [-> { a.fail }, -> { b.fail }, -> { c.fail }]
}

[true, false].each do |tf|
  [true, false].each do |tf2|
    [true, false].each do |tf3|
      puts truth_table[[tf, tf2, tf3]].map(&:call).join(",")
    end
  end
end
