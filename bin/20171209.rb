require 'advent_of_code'

puts "Advent 2017/12/09"

text = File.read('data/20171209.txt')

scorer = December9.new

score = scorer.score(text)

puts "Step 1: #{score}"

garbage = scorer.count_garbage(text)

puts "Step 2: #{garbage}"
