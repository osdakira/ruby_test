def qsort(_list)
  return _list if _list.empty?
  x = _list.shift
  qsort(_list.select { |y| y > x }) + [x] + qsort(_list.select { |y| y <= x })
end

p qsort([3, 5, 1, 4, 2])
p qsort([2, 2, 3, 1, 1])
