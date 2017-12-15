require 'advent_of_code'

puts "Advent 2017/12/08"

text = File.read('data/20171208.txt')

p = December8.new(text)

max = p.max_value

puts "Step 1: #{max}"

max = p.highest_value

puts "Step 2: #{max}"
