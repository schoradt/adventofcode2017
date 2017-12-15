require 'advent_of_code'

puts "Advent 2017/12/14"

text = 'ljoxqyyw'

sim = December14.new

res1 = sim.process_step1(text)

puts "Step1: #{res1}"

res2 = sim.process_step2(text)

puts "Step2: #{res2}"