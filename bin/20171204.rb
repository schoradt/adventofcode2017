require 'advent_of_code'

puts "Advent 2017/12/04"

text = File.read('data/20171204.txt')

checker = December4.new

res1 = checker.process_step1(text)

puts "Step 1: #{res1}"

res2 = checker.process_step2(text)

puts "Step 2: #{res2}"

