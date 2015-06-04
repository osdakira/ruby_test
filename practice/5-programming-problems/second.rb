# 交互に要素を取ることで、2つのリストを結合する関数を記述せよ。例えば [a, b, c]と[1, 2, 3]という2つのリストを与えると、関数は [a, 1, b, 2, c, 3]を返す。
a_list = [:a, :b, :c]
b_list = [1, 2, 3]

def ruby_zip(a_list, b_list)
  a_list.zip(b_list).flatten
end

# ループを使うより、破壊した方が良いか？
def my_zip(a_list, b_list)
  c_list = []
  if a_list.size >= b_list.size
    long, short = a_list, b_list
  else
    long, short = b_list, a_list
  end

  long.each_with_index do |a, i|
    c_list << a
    c_list << short[i] if short[i]
  end
  c_list
end

fail unless ruby_zip(a_list, b_list) == [:a, 1, :b, 2, :c, 3]
fail unless my_zip(a_list, b_list) == [:a, 1, :b, 2, :c, 3]
