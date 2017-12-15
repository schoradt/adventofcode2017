require 'advent_of_code'

puts "Advent 2017/12/13"

text = File.read('data/20171213.txt')

sim = December13.new

sim.load(text)

res1 = sim.process_step1

puts "Step1: #{res1}"

res2 = sim.process_step2

puts "Step2: #{res2}"