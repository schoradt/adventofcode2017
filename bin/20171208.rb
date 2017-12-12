require 'advent_of_code'

text = File.read('data/20171208.txt')

p = December8.new(text)

max = p.max_value

puts "Maximum register value is #{max}"

max = p.highest_value

puts "Highest register value is #{max}"
