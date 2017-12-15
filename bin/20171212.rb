require 'advent_of_code'

puts "Advent 2017/12/12"

text = File.read('data/20171212.txt')

graph = December12.new

graph.load(text)

res1 = graph.process_step1

puts "Step1: #{res1}"

res2 = graph.process_step2

puts "Step1: #{res2}"