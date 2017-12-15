require 'advent_of_code'

puts "Advent 2017/12/02"

text = File.read('data/20171202.txt')

res1 = December2.checksum(text)

puts "Step1: #{res1}"

res2 = December2.checksum2(text)

puts "Step2: #{res2}"
