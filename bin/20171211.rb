require 'advent_of_code'

text = File.read('data/20171211.txt')

dist = December11.process_step1(text)

puts "Distance is #{dist}"

dist = December11.process_step2(text)

puts "Max-Distance is #{dist}"