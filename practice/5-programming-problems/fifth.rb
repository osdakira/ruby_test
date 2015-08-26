# 1,2,…,9の数をこの順序で、”+”、”-“、またはななにもせず結果が100となるあらゆる組合せを出力するプログラムを記述せよ。
# 例えば、1 + 2 + 34 – 5 + 67 – 8 + 9 = 100となる

# num_list = [*1..9]
# num_list.insert(1, "+")
# p num_list.join
# p eval(num_list.join)

def just_handreds
  base_num_list = [*1..9]
  (1..8).each do |i|
    num_list = base_num_list.dup.insert(i, "+")
    p num_list.join
    p eval(num_list.join)
  end
end

just_handreds
