# coding: utf-8

# 閏年判定

def is_leap_day(year)
  if year % 4 == 0 and year % 100 != 0
    puts "#{ year }は閏年です"
  elsif year % 400 == 0
    puts "#{ year }は閏年です"
  else
    puts "#{ year }は閏年ではありません"
  end
end

is_leap_day 1992
is_leap_day 2000
is_leap_day 2001

(1900..2001).each{ | year | is_leap_day year }
