require 'advent_of_code';

text = File.read('data/20171207.txt')

t = December7.new(text)

root = t.root.name

puts "Root node is #{root}"

t.root.check_balance
