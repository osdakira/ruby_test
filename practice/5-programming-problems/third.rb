# 最初の100個のフィボナッチ数のリストを計算する関数を記述せよ。
# 定義では、フィボナッチ数列の最初の2つの数字は0と1で、次の数は前の2つの合計となる。
# 例えば最初の10個のフィボナッチ数列は、0, 1, 1, 2, 3, 5, 8, 13, 21, 34となる。

def fibonacchi(n)
  return 0 if n == 1
  return 1 if n == 2
  fibonacchi(n - 1) + fibonacchi(n - 2)
end

def fibonacchi_list(num)
  num.times.map { |n| fibonacchi(n + 1) }
end

p fibonacchi_list(10)
fail unless fibonacchi_list(10) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

# 再帰すると死ぬ。 メモ化が必要
# p fibonacchi_list(100)

def new_fibonacchi_list(num)
  memos = {}
  (1..num).map do |n|
    case n
    when 1
      memos[n] = 0
    when 2
      memos[n] = 1
    else
      memos[n] = memos[n-1] + memos[n-2]
    end
  end
  memos.values
end

p new_fibonacchi_list(10)
fail unless new_fibonacchi_list(10) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

p new_fibonacchi_list(100)
