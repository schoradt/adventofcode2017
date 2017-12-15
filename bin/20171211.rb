require 'advent_of_code'

puts "Advent 2017/12/11"

text = File.read('data/20171211.txt')

dist = December11.process_step1(text)

puts "Step 1: #{dist}"

dist = December11.process_step2(text)

puts "Step 2: #{dist}"