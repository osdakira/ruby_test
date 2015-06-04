# 正の整数のリストを与えられたとき、数を並び替えて可能な最大数を返す関数を記述せよ。
# 例えば、[50, 2, 1, 9]が与えられた時、95021が答えとなる

def get_max_num(num_list)
  num_list.map(&:to_s).sort.reverse.join
end

fail unless get_max_num([50, 2, 1, 9]) == "95021"
