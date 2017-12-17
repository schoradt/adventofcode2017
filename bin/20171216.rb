require 'advent_of_code'

puts "Advent 2017/12/16"

text = File.read('data/20171216.txt')

c = December16.new

c.init('abcdefghijklmnop')

steps = c.prepare(text)

c.dance(steps)

res1 = c.to_s

puts "Step1: #{res1}"

c = December16.new

c.init('abcdefghijklmnop')

steps = c.prepare(text)

1000000000.downto(0) do |i| 
  puts "    #{i}" if i % 100 == 0
  c.dance(steps)
end

res2 = c.to_s

puts "Step2: #{res2}"