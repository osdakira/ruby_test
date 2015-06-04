# forループ、whileループ、および再帰を使用して、リスト内の数字の合計を計算する3つの関数を記述せよ。

list = [*1..10]

def sum_by_for(list)
  sum = 0
  for i in list
    sum += i
  end
  sum
end

if sum_by_for(list) == 55
  p "ok sum_by_for(list)"
else
  fail "fail sum_by_while"
end


def sum_by_while(list)
  sum = 0
  i = 0
  size = list.size
  while i < size
    sum += list[i]
  end
  sum
end

if sum_by_for(list) == 55
  p "ok sum_by_while"
else
  fail "fail sum_by_while"
end

def sum_by_recursion(list)
  return 0 if list.empty?
  list.shift + sum_by_recursion(list)
end

if sum_by_recursion(list) == 55
  p "ok sum_by_recursion(list)"
else
  fail "fail sum_by_recursion(list)"
end
