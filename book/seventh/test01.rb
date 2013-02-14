# -*- coding: utf-8 -*-

# 七つの言語、七つの世界. Ruby

# • 文字列 “Hello, world” を出力する.
# • 文字列 “Hello, Ruby” の中の “Ruby” という単語のインデックスを検索する.
# • 自分の名前を 10 回出力する.
# • 文字列 “This is sentence number 1” の 1 を 10 までカウントアップしながら 10 回
# 出力する.
# • ファイルに格納されている Ruby のプログラムを実行する.
# • ボーナス問題:少し物足りない人は,乱数を選択するプログラムを書いてみてほし
# い.プレーヤーに数字を選択してもらい,その数字が生成された乱数よりも大き
# いか小さいかを返す.
# (ヒント:rand(10) は 0~9 までの乱数を生成する.gets はキーボードから文字
# 列を読み込む.この文字列をプログラムで整数に変換する.)

puts "hello, world"

puts "Hello, Ruby".index("Ruby")

(1..10).each{puts "my name"}

(1..10).each{ | i | puts "This is sentence number #{i}"}

require "./some.rb"

puts "choice digit from 1 to 10"
print "=>"
while line = gets
  input = line.strip.to_i
  r = rand(10)
  print "#{input} #{input >= r ? 'higher' : 'lower'} then #{r}\n"
end
