require 'advent_of_code'

puts "Advent 2017/12/05"

text = File.read('data/20171205.txt')

c = December5.new(text)

res1 = c.process_step1

puts "Step 1: #{res1}"

c = December5.new(text)

res2 = c.process_step2

puts "Step 2: #{res2}"
