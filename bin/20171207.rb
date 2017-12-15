require 'advent_of_code'

puts "Advent 2017/12/07"

text = File.read('data/20171207.txt')

t = December7.new(text)

res1 = t.process_step1

puts "Step 1: #{res1}"

res2 = t.process_step2

puts "Step 2: #{res2}"
