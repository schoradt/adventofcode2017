require 'AdventOfCode';

text = File.read('data/20171202.txt')

sum = December2.checksum(text)

puts "checksum: #{sum}"

sum = December2.checksum2(text)

puts "checksum: #{sum}"