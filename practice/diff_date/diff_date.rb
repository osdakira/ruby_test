require 'action_view'

include ActionView::Helpers::DateHelper

d1 = Date.new(2014, 3, 3)
d2 = Date.new(2014, 5, 10)

diff = distance_of_time_in_words(d1, d2)
puts diff
