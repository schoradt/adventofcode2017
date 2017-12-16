require 'advent_of_code'

puts "Advent 2017/12/16"

text = File.read('data/20171216.txt')

c = December16.new

c.init('abcdefghijklmnop')

c.dance(text)

res1 = c.to_s

puts "Step1: #{res1}"

#res2 = December15.new(634, 301).process_step2

#puts "Step2: #{res2}"